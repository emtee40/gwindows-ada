------------------------------------------------------------------------------
--                                                                          --
--       GNAVI - The GNU Ada Visual Interface - Open Source Visual RAD      --
--                                                                          --
--                            T E M P L A T E S                             --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                             $Revision: 1.11 $
--                                                                          --
--                  Copyright (C) 1999-2004 David Botton                    --
--                                                                          --
-- This is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion. It is distributed in the hope that it will be useful,  but WITHOUT --
-- ANY WARRANTY;  without  even the  implied warranty of MERCHANTABILITY or --
-- FITNESS FOR A PARTICULAR PURPOSE.    See the GNU General  Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with this;  see file COPYING.  If not, write --
-- to  the Free Software Foundation,  59 Temple Place - Suite 330,  Boston, --
-- MA 02111-1307, USA.                                                      --
--                                                                          --
-- More information about GNAVI and the most current version can            --
-- be located on the web at http://www.gnavi.org                            --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Text_IO;
with Ada.Exceptions;

with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants;

with GNAT.OS_Lib;

package body Templates is

   NL_Mode : New_Line_Mode_Type := DOS;

   NL_UNIX : constant String := "" & Character'Val (10);

   NL_DOS  : constant String := Character'Val (13) & Character'Val (10);

   Temp_Dir : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.To_Unbounded_String ("templates/");

   function Load_Template (Template_Name : String) return String
   is
   begin
      return Load_File (Template_Dir & Template_Name);
   end Load_Template;

   function Load_File (File_Spec : String) return String
   is
      use Ada.Text_IO;

      Temp_File   : File_Type;
      Max_Length  : constant := 1024;

      function Load_More (Front : String) return String;
      --  Load lines of file

      function Load_More (Front : String) return String is
         O_String    : String (1 .. Max_Length);
         Line_Length : Natural;
      begin
         if End_Of_File (Temp_File) then
            return Front;
         end if;

         Get_Line (Temp_File, O_String, Line_Length);

         if End_Of_File (Temp_File) then
            Close (Temp_File);
            return Front & O_String (1 .. Line_Length) & NL;
         else
            return Load_More (Front & O_String (1 .. Line_Length) & NL);
         end if;
      end Load_More;

   begin
      Open (Temp_File, In_File, File_Spec);
      return Load_More ("");
   exception
      when others =>
         Ada.Exceptions.Raise_Exception
           (GNAVI_File_Load_Error'Identity, "Unable to load : " & File_Spec);
   end Load_File;

   procedure Write_File (File_Spec : String; Contents : String)
   is
      use GNAT.OS_Lib;

      O_File : File_Descriptor;
      Result : Integer;
   begin
      O_File := Create_File (File_Spec, Binary);
      Result := Write (O_File,
                       Contents (Contents'First)'Address,
                       Contents'Length);
      Close (O_File);
   exception
      when others =>
         Ada.Exceptions.Raise_Exception
           (GNAVI_File_Write_Error'Identity, "Unable to write : " & File_Spec);
   end Write_File;

   procedure Update_File (File_Spec : String; Contents : String)
   is
   begin
      if GNAT.OS_Lib.Is_Regular_File (File_Spec) then
         declare
            S : constant String := Load_File (File_Spec);
         begin
            if S /= Contents then
               Write_File (File_Spec, Contents);
            end if;
         end;
      else
         Write_File (File_Spec, Contents);
      end if;
   end Update_File;

   procedure Set_New_Line_Mode (Mode : New_Line_Mode_Type)
   is
   begin
      NL_Mode := Mode;
   end Set_New_Line_Mode;


   function NL return String is
   begin
      case NL_Mode is
         when DOS =>
            return NL_DOS;
         when UNIX =>
            return NL_UNIX;
      end case;
   end NL;

   procedure Template_Dir (Dir : String)
   is
   begin
      Temp_Dir := Ada.Strings.Unbounded.To_Unbounded_String (Dir);
   end Template_Dir;

   function Template_Dir return String
   is
   begin
      return Ada.Strings.Unbounded.To_String (Temp_Dir);
   end Template_Dir;

   procedure Execute (File_Spec     : String;
                      Template_Name : String;
                      Trans_Table   : Templates_Parser.Translate_Table)
   is
   begin
      Write_File (File_Spec,
                  Templates_Parser.Parse (Template_Dir & Template_Name,
                                          Trans_Table));
   end Execute;

   procedure Check_For_With (File_Spec   : String;
                             With_String : String)
   is
      use Ada.Strings.Fixed;
      use Ada.Strings.Maps.Constants;

      File : constant String := Load_File (File_Spec);
   begin
      if
        Index (File,
               Translate ("with " & With_String, Lower_Case_Map),
               Mapping => Lower_Case_Map) = 0
      then
         Write_File (File_Spec, "with " & With_String & ";" & NL & File);
      end if;
   end Check_For_With;

   function With_Of (Type_Name : String) return String
   is
      use Ada.Strings.Fixed;
   begin
      return Type_Name (Type_Name'First .. Index
                          (Type_Name, ".", Ada.Strings.Backward) - 1);
   end With_Of;

   procedure Set_Control_Block (File_Spec : String;
                                Block     : String)
   is
      use Ada.Text_IO;
      use Ada.Strings.Fixed;

      Temp_File   : File_Type;
      Max_Length  : constant := 1024;
      Skip        : Boolean := False;
      Do_Write    : Boolean := True;

      function Load_More (Front : String; Old_Block : String) return String;
      --  Load lines of file

      function Load_More (Front : String; Old_Block : String) return String is
         O_String    : String (1 .. Max_Length);
         Line_Length : Natural;
      begin
         Get_Line (Temp_File, O_String, Line_Length);

         if Skip then
            if End_Of_File (Temp_File) then
               raise GNAVI_Comment_Removed_Error;
            end if;

            if Index (O_String (1 .. Line_Length), "--  GNAVI:") > 0 then
               Skip := False;

               if (NL & Block) = (Old_Block & NL) then
                  Do_Write := False;
               else
                  Do_Write := True;
               end if;

            else
               return Load_More
                 (Front, Old_Block & NL & O_String (1 .. Line_Length));
            end if;
         end if;


         if Index (O_String (1 .. Line_Length), "--  GNAVI: Controls") > 0 then
            Skip := True;
            return Load_More (Front & O_String (1 .. Line_Length) & NL &
                                Block, "");
         end if;

         if End_Of_File (Temp_File) then
            Close (Temp_File);
            return Front & O_String (1 .. Line_Length) & NL;
         else
            return Load_More (Front & O_String (1 .. Line_Length) & NL, "");
         end if;
      end Load_More;

   begin
      Open (Temp_File, In_File, File_Spec);

      declare
         W : constant String := Load_More ("", "");
      begin
         if Do_Write then
            Write_File (File_Spec, W);
         end if;
      end;
   end Set_Control_Block;

   procedure Check_For_Handler (Package_Name : String;
                                Handler_Name : String;
                                Handler_Type : String)
   is
      use Ada.Text_IO;
      use Ada.Strings.Fixed;
      use Ada.Strings.Maps.Constants;

      use Templates_Parser;

      Temp_File         : File_Type;
      Max_Length        : constant := 1024;
      Found             : Boolean := False;
      Write_File        : Boolean := False;

      Handler_Procedure : constant String := "procedure " &
        Translate (Handler_Name, Lower_Case_Map);

      Current_File      : String := ".ads";

      Window_Base       : constant String :=
        Translate (Package_Name, Lower_Case_Map);

      Handler_Base      : constant String :=
        Translate (Handler_Type, Lower_Case_Map);

      Trans             : constant Translate_Table :=
        (1 => Assoc ("Handler_Name", Handler_Name));

      function Load_More (Front : String) return String;
      --  Load lines of file

      function Load_More (Front : String) return String is
         O_String    : String (1 .. Max_Length);
         Line_Length : Natural;
      begin
         if End_Of_File (Temp_File) then
            return Front;
         end if;

         Get_Line (Temp_File, O_String, Line_Length);

         if not Found then

            if Index (O_String (1 .. Line_Length),
                      Handler_Procedure,
                      Mapping => Lower_Case_Map) > 0
            then
               Found := True;
               return "";
            end if;

            if
              Index (O_String (1 .. Line_Length),
                     "end " & Translate (Package_Name, Lower_Case_Map),
                     Mapping => Lower_Case_Map) > 0
              or
              Index (O_String (1 .. Line_Length),
                     "--  GNAVI: Create Global Instance") > 0
            then
               Found := True;
               Write_File := True;

               return Load_More
                 (Front &
                  Translate (Load_Template (Handler_Base & Current_File),
                             Trans) & NL &
                  O_String (1 .. Line_Length) & NL);
            end if;

         end if;


         if End_Of_File (Temp_File) then
            return Front & O_String (1 .. Line_Length) & NL;
         else
            return Load_More (Front & O_String (1 .. Line_Length) & NL);
         end if;
      end Load_More;

   begin
      Open (Temp_File, In_File, Window_Base & Current_File);

      declare
         W : constant String := Load_More ("");
      begin
         Close (Temp_File);

         if Write_File then
            Templates.Write_File (Window_Base & Current_File, W);
         end if;
      end;

      Current_File := ".adb";
      Found := False;
      Write_File := False;

      Open (Temp_File, In_File, Window_Base & Current_File);

      declare
         W : constant String := Load_More ("");
      begin
         Close (Temp_File);

         if Write_File then
            Templates.Write_File (Window_Base & Current_File, W);
         end if;
      end;

   end Check_For_Handler;

end Templates;
