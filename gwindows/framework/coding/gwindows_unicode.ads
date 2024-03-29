------------------------------------------------------------------------------
--                                                                          --
--         GWINDOWS - Ada 95 Framework for Windows GUI Development          --
--                                                                          --
--                             G W I N D O W S                              --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--                                                                          --
--                 Copyright (C) 1999 - 2022 David Botton                   --
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
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
-- More information about GWindows and the latest current release can       --
-- be located on the web at one of the following places:                    --
--   https://sourceforge.net/projects/gnavi/                                --
--   https://github.com/zertovitch/gwindows                                 --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Strings.Wide_Unbounded;
with Interfaces.C;

package GWindows is
   pragma Linker_Options ("-luser32");
   pragma Linker_Options ("-lgdi32");

   type Character_Mode_Type is (ANSI, Unicode);

   --  Bind to UNICODE version of the Windows API.
   --
   --  For setting the character mode of GWindows (concerns
   --  this file and 5 others), please use the ansi.cmd or
   --  unicode.cmd scripts.

   Character_Mode : constant Character_Mode_Type := Unicode;
   Character_Mode_Identifier : constant String := "W";

   subtype GCharacter is Wide_Character;
   subtype GString is Wide_String;
   subtype GString_Unbounded is
      Ada.Strings.Wide_Unbounded.Unbounded_Wide_String;
   Null_GString_Unbounded : constant GString_Unbounded :=
      Ada.Strings.Wide_Unbounded.Null_Unbounded_Wide_String;

   subtype GChar_C is Interfaces.C.wchar_t;
   subtype GString_C is Interfaces.C.wchar_array;
   GString_C_Null : constant GChar_C := Interfaces.C.wide_nul;

   --  Universal

   type Pointer_To_GCharacter is access all GCharacter;
   type Pointer_To_GString is access all GString;
   type Pointer_To_GChar_C is access all GChar_C;
   type Pointer_To_GString_C is access all GString_C;

end GWindows;
