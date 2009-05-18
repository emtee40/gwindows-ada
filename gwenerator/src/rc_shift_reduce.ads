package Rc_Shift_Reduce is

    type Small_Integer is range -32_000 .. 32_000;

    type Shift_Reduce_Entry is record
        T   : Small_Integer;
        Act : Small_Integer;
    end record;
    pragma Pack(Shift_Reduce_Entry);

    subtype Row is Integer range -1 .. Integer'Last;

  --pragma suppress(index_check);

    type Shift_Reduce_Array is array (Row  range <>) of Shift_Reduce_Entry;

    Shift_Reduce_Matrix : constant Shift_Reduce_Array :=
        ( (-1,-1) -- Dummy Entry

-- State  0
,( 1, 2),( 2, 21),( 9, 22),( 16, 20),( 30, 23),( 292, 25),( 294, 24),( 295, 19),(-1,-3000)
-- State  1
,(-1,-1)
-- State  2
,(-1,-2)
-- State  3
,( 2, 21),( 9, 22),( 16, 20),( 30, 23),( 292, 25),( 294, 24),( 295, 19),(-1,-3)
-- State  4
,(-1,-5)
-- State  5
,(-1,-6)
-- State  6
,(-1,-7)
-- State  7
,(-1,-8)
-- State  8
,(-1,-9)
-- State  9
,(-1,-10)
-- State  10
,(-1,-11)
-- State  11
,(-1,-12)
-- State  12
,(-1,-13)
-- State  13
,(-1,-14)
-- State  14
,(-1,-15)
-- State  15
,(-1,-16)
-- State  16
,(-1,-17)
-- State  17
,(-1,-18)
-- State  18
,( 32, 39),( 33, 40),( 34,-391),( 44, 35),( 52, 31),( 53, 28),( 54, 29),( 55, 30),( 56, 32),( 57, 37),( 67, 38),(-1,-47)
-- State  19
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  20
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  21
,( 28, 52),( 29, 53),(-1,-517)
-- State  22
,( 296, 54),( 297, 55),(-1,-3000)
-- State  23
,( 31, 56),(-1,-3000)
-- State  24
,(-1,-516)
-- State  25
,(-1,-518)
-- State  26
,( 0,-3001),(-1,-3000)
-- State  27
,(-1,-4)
-- State  28
,(-1,-440)
-- State  29
,(-1,-441)
-- State  30
,(-1,-442)
-- State  31
,(-1,-443)
-- State  32
,(-1,-444)
-- State  33
,( 10, 58),( 11, 59),(-1,-3000)
-- State  34
,( 34, 61),(-1,-3000)
-- State  35
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  36
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  37
,(-1,-447)
-- State  38
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  39
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  40
,( 6, 68),( 14, 67),(-1,-3000)
-- State  41
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  42
,(-1,-71)
-- State  43
,(-1,-72)
-- State  44
,(-1,-73)
-- State  45
,(-1,-74)
-- State  46
,(-1,-75)
-- State  47
,(-1,-76)
-- State  48
,(-1,-77)
-- State  49
,( 6, 68),( 14, 67),(-1,-3000)
-- State  50
,(-1,-517)
-- State  51
,( 4, 72),(-1,-3000)
-- State  52
,( 296, 73),(-1,-3000)
-- State  53
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  54
,(-1,-494)
-- State  55
,(-1,-495)
-- State  56
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  57
,(-1,-3000)
-- State  58
,(-1,-53)
-- State  59
,(-1,-54)
-- State  60
,(-1,-48)
-- State  61
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  62
,( 6, 68),( 14, 67),(-1,-3000)
-- State  63
,( 2, 50),( 292, 25),( 294, 24),( 296, 80),(-1,-3000)
-- State  64
,( 58, 85),( 59, 86),( 60, 87),( 61, 88),( 62, 89),( 63, 90),( 64, 91),(-1,-449)
-- State  65
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  66
,( 296, 94),(-1,-3000)
-- State  67
,(-1,-521)
-- State  68
,(-1,-522)
-- State  69
,( 2, 50),( 292, 25),( 294, 24),( 296, 97),(-1,-3000)
-- State  70
,(-1,-70)
-- State  71
,( 2, 50),( 292, 25),( 294, 24),(-1,-482)
-- State  72
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  73
,(-1,-487)
-- State  74
,( 6, 68),( 14, 67),(-1,-3000)
-- State  75
,( 6, 68),( 14, 67),(-1,-3000)
-- State  76
,( 21, 42),( 22, 43),( 23, 44),( 24, 45),( 25, 46),( 26, 47),( 27, 48),(-1,-69)
-- State  77
,(-1,-392)
-- State  78
,( 2, 50),( 292, 25),( 294, 24),( 296, 112),(-1,-422)
-- State  79
,(-1,-445)
-- State  80
,(-1,-446)
-- State  81
,(-1,-439)
-- State  82
,(-1,-450)
-- State  83
,( 58, 85),( 59, 86),( 60, 87),( 61, 88),( 62, 89),( 63, 90),( 64, 91),(-1,-451)
-- State  84
,(-1,-453)
-- State  85
,(-1,-454)
-- State  86
,(-1,-455)
-- State  87
,(-1,-456)
-- State  88
,(-1,-457)
-- State  89
,(-1,-458)
-- State  90
,(-1,-459)
-- State  91
,(-1,-460)
-- State  92
,( 6, 68),( 14, 67),( 65, 121),( 66, 120),(-1,-3000)
-- State  93
,( 4, 123),(-1,-3000)
-- State  94
,(-1,-509)
-- State  95
,( 2, 50),( 4, 125),( 292, 25),( 294, 24),( 296, 97),(-1,-511)
-- State  96
,(-1,-514)
-- State  97
,(-1,-515)
-- State  98
,( 7, 127),( 15, 126),(-1,-3000)
-- State  99
,(-1,-483)
-- State  100
,( 2, 50),( 292, 25),( 294, 24),(-1,-484)
-- State  101
,( 296, 130),(-1,-3000)
-- State  102
,( 7, 127),( 15, 126),(-1,-3000)
-- State  103
,(-1,-64)
-- State  104
,( 296, 134),(-1,-489)
-- State  105
,( 2, 50),( 292, 25),( 294, 24),( 296, 140),(-1,-497)
-- State  106
,( 2, 142),(-1,-3000)
-- State  107
,( 6, 68),( 14, 67),(-1,-3000)
-- State  108
,(-1,-423)
-- State  109
,( 2, 50),( 292, 25),( 294, 24),( 296, 112),(-1,-424)
-- State  110
,( 4, 146),(-1,-3000)
-- State  111
,(-1,-427)
-- State  112
,(-1,-428)
-- State  113
,( 7, 127),( 15, 126),(-1,-3000)
-- State  114
,(-1,-452)
-- State  115
,(-1,-461)
-- State  116
,(-1,-462)
-- State  117
,( 65, 121),( 66, 120),(-1,-3000)
-- State  118
,( 65, 121),( 66, 120),(-1,-464)
-- State  119
,(-1,-466)
-- State  120
,(-1,-467)
-- State  121
,( 296, 151),(-1,-3000)
-- State  122
,(-1,-448)
-- State  123
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  124
,(-1,-512)
-- State  125
,( 2, 50),( 292, 25),( 294, 24),( 296, 97),(-1,-3000)
-- State  126
,(-1,-523)
-- State  127
,(-1,-524)
-- State  128
,(-1,-510)
-- State  129
,(-1,-485)
-- State  130
,(-1,-486)
-- State  131
,(-1,-481)
-- State  132
,(-1,-490)
-- State  133
,( 296, 134),(-1,-491)
-- State  134
,(-1,-493)
-- State  135
,( 7, 127),( 15, 126),(-1,-3000)
-- State  136
,(-1,-498)
-- State  137
,( 2, 50),( 292, 25),( 294, 24),( 296, 140),(-1,-499)
-- State  138
,( 4, 157),(-1,-3000)
-- State  139
,(-1,-502)
-- State  140
,(-1,-503)
-- State  141
,( 7, 127),( 15, 126),(-1,-3000)
-- State  142
,(-1,-387)
-- State  143
,(-1,-49)
-- State  144
,(-1,-393)
-- State  145
,(-1,-425)
-- State  146
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  147
,(-1,-421)
-- State  148
,( 7, 127),( 15, 126),(-1,-3000)
-- State  149
,(-1,-465)
-- State  150
,( 2, 166),( 296, 165),(-1,-3000)
-- State  151
,( 6, 68),( 14, 67),(-1,-3000)
-- State  152
,( 6, 68),( 14, 67),(-1,-3000)
-- State  153
,(-1,-513)
-- State  154
,(-1,-492)
-- State  155
,(-1,-488)
-- State  156
,(-1,-500)
-- State  157
,( 10, 170),(-1,-3000)
-- State  158
,(-1,-496)
-- State  159
,( 4, 171),(-1,-3000)
-- State  160
,( 13, 180),( 16, 20),( 17, 182),( 18, 183),( 19, 181),( 20, 185),( 34, 184),(-1,-55)
-- State  161
,( 35, 193),( 36, 192),(-1,-395)
-- State  162
,( 4, 195),(-1,-429)
-- State  163
,(-1,-463)
-- State  164
,( 4, 197),(-1,-470)
-- State  165
,(-1,-472)
-- State  166
,(-1,-473)
-- State  167
,(-1,-468)
-- State  168
,(-1,-469)
-- State  169
,( 37, 201),( 68, 200),(-1,-475)
-- State  170
,( 6, 68),( 14, 67),(-1,-3000)
-- State  171
,( 2, 204),(-1,-3000)
-- State  172
,( 13, 180),( 16, 20),( 17, 182),( 18, 183),( 19, 181),( 20, 185),( 34, 184),(-1,-55)
-- State  173
,(-1,-57)
-- State  174
,(-1,-58)
-- State  175
,(-1,-59)
-- State  176
,(-1,-60)
-- State  177
,(-1,-61)
-- State  178
,(-1,-62)
-- State  179
,(-1,-63)
-- State  180
,( 296, 206),(-1,-3000)
-- State  181
,(-1,-65)
-- State  182
,( 2, 223),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 135, 209),( 136, 210),( 137, 211),( 138, 212)
,( 139, 214),( 140, 213),( 141, 215),( 142, 216),( 143, 217),( 144, 218),( 145, 219),( 146, 220),( 147, 221),(-1,-3000)
-- State  183
,( 2, 248),( 279, 249),( 280, 251),( 281, 253),( 282, 254),( 283, 255),( 284, 252),( 285, 256),( 286, 257),( 287, 258),( 288, 260),( 289, 259),( 290, 261)
,( 291, 250),(-1,-3000)
-- State  184
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  185
,( 85, 266),( 86, 267),( 87, 268),( 88, 269),( 89, 270),( 90, 271),( 91, 272),( 92, 273),( 93, 274),( 94, 275),( 95, 276),( 96, 277),( 97, 278)
,( 98, 279),( 99, 280),( 100, 281),( 101, 282),( 102, 283),( 103, 284),( 104, 285),( 105, 286),( 106, 287),( 107, 288),( 108, 289),( 109, 290),( 110, 291)
,( 111, 292),( 112, 293),( 113, 294),( 114, 295),( 296, 265),(-1,-3000)
-- State  186
,(-1,-50)
-- State  187
,(-1,-396)
-- State  188
,( 35, 193),( 36, 192),(-1,-397)
-- State  189
,(-1,-399)
-- State  190
,(-1,-400)
-- State  191
,(-1,-401)
-- State  192
,( 37, 300),( 296, 299),(-1,-3000)
-- State  193
,( 296, 301),(-1,-3000)
-- State  194
,( 7, 127),( 15, 126),(-1,-3000)
-- State  195
,( 12, 309),( 47, 304),( 48, 305),( 49, 306),( 50, 307),( 51, 308),(-1,-3000)
-- State  196
,(-1,-426)
-- State  197
,( 2, 166),( 296, 165),(-1,-3000)
-- State  198
,(-1,-476)
-- State  199
,( 37, 201),( 68, 200),(-1,-477)
-- State  200
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  201
,(-1,-480)
-- State  202
,( 7, 127),( 15, 126),(-1,-3000)
-- State  203
,( 2, 50),( 292, 25),( 294, 24),(-1,-504)
-- State  204
,(-1,-388)
-- State  205
,(-1,-56)
-- State  206
,(-1,-99)
-- State  207
,( 2, 320),(-1,-3000)
-- State  208
,( 5, 321),(-1,-79)
-- State  209
,(-1,-81)
-- State  210
,(-1,-82)
-- State  211
,(-1,-83)
-- State  212
,(-1,-84)
-- State  213
,(-1,-85)
-- State  214
,(-1,-86)
-- State  215
,(-1,-87)
-- State  216
,(-1,-88)
-- State  217
,(-1,-89)
-- State  218
,(-1,-90)
-- State  219
,(-1,-91)
-- State  220
,(-1,-92)
-- State  221
,(-1,-93)
-- State  222
,(-1,-94)
-- State  223
,(-1,-95)
-- State  224
,(-1,-23)
-- State  225
,(-1,-24)
-- State  226
,(-1,-25)
-- State  227
,( 115, 322),( 117, 323),( 123, 324),( 124, 325),(-1,-3000)
-- State  228
,(-1,-27)
-- State  229
,(-1,-29)
-- State  230
,(-1,-30)
-- State  231
,(-1,-31)
-- State  232
,(-1,-32)
-- State  233
,(-1,-33)
-- State  234
,(-1,-35)
-- State  235
,(-1,-37)
-- State  236
,(-1,-38)
-- State  237
,(-1,-39)
-- State  238
,(-1,-40)
-- State  239
,(-1,-41)
-- State  240
,(-1,-42)
-- State  241
,(-1,-43)
-- State  242
,(-1,-44)
-- State  243
,(-1,-45)
-- State  244
,(-1,-46)
-- State  245
,(-1,-78)
-- State  246
,( 5, 326),(-1,-215)
-- State  247
,(-1,-217)
-- State  248
,(-1,-218)
-- State  249
,(-1,-219)
-- State  250
,(-1,-220)
-- State  251
,(-1,-221)
-- State  252
,(-1,-222)
-- State  253
,(-1,-223)
-- State  254
,(-1,-224)
-- State  255
,(-1,-225)
-- State  256
,(-1,-226)
-- State  257
,(-1,-227)
-- State  258
,(-1,-228)
-- State  259
,(-1,-229)
-- State  260
,(-1,-230)
-- State  261
,(-1,-231)
-- State  262
,(-1,-96)
-- State  263
,(-1,-97)
-- State  264
,(-1,-121)
-- State  265
,(-1,-122)
-- State  266
,(-1,-123)
-- State  267
,(-1,-124)
-- State  268
,(-1,-125)
-- State  269
,(-1,-126)
-- State  270
,(-1,-127)
-- State  271
,(-1,-128)
-- State  272
,(-1,-129)
-- State  273
,(-1,-130)
-- State  274
,(-1,-131)
-- State  275
,(-1,-132)
-- State  276
,(-1,-133)
-- State  277
,(-1,-134)
-- State  278
,(-1,-135)
-- State  279
,(-1,-136)
-- State  280
,(-1,-137)
-- State  281
,(-1,-138)
-- State  282
,(-1,-139)
-- State  283
,(-1,-140)
-- State  284
,(-1,-141)
-- State  285
,(-1,-142)
-- State  286
,(-1,-143)
-- State  287
,(-1,-144)
-- State  288
,(-1,-145)
-- State  289
,(-1,-146)
-- State  290
,(-1,-147)
-- State  291
,(-1,-148)
-- State  292
,(-1,-149)
-- State  293
,(-1,-150)
-- State  294
,(-1,-151)
-- State  295
,(-1,-152)
-- State  296
,(-1,-98)
-- State  297
,( 6, 68),( 14, 67),(-1,-3000)
-- State  298
,(-1,-398)
-- State  299
,(-1,-405)
-- State  300
,(-1,-420)
-- State  301
,(-1,-402)
-- State  302
,(-1,-394)
-- State  303
,( 4, 330),(-1,-431)
-- State  304
,(-1,-433)
-- State  305
,(-1,-434)
-- State  306
,(-1,-435)
-- State  307
,(-1,-436)
-- State  308
,(-1,-437)
-- State  309
,(-1,-438)
-- State  310
,(-1,-430)
-- State  311
,(-1,-471)
-- State  312
,(-1,-478)
-- State  313
,(-1,-479)
-- State  314
,(-1,-474)
-- State  315
,(-1,-505)
-- State  316
,( 2, 50),( 292, 25),( 294, 24),(-1,-506)
-- State  317
,( 4, 332),(-1,-3000)
-- State  318
,( 7, 127),( 15, 126),(-1,-3000)
-- State  319
,( 4, 334),(-1,-3000)
-- State  320
,( 4, 335),(-1,-3000)
-- State  321
,( 2, 223),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 135, 209),( 136, 210),( 137, 211),( 138, 212)
,( 139, 214),( 140, 213),( 141, 215),( 142, 216),( 143, 217),( 144, 218),( 145, 219),( 146, 220),( 147, 221),(-1,-3000)
-- State  322
,(-1,-26)
-- State  323
,(-1,-28)
-- State  324
,(-1,-34)
-- State  325
,(-1,-36)
-- State  326
,( 2, 248),( 279, 249),( 280, 251),( 281, 253),( 282, 254),( 283, 255),( 284, 252),( 285, 256),( 286, 257),( 287, 258),( 288, 260),( 289, 259),( 290, 261)
,( 291, 250),(-1,-3000)
-- State  327
,(-1,-51)
-- State  328
,( 4, 339),(-1,-3000)
-- State  329
,( 4, 340),( 38, 343),( 39, 344),( 40, 345),( 41, 346),( 42, 347),( 43, 348),(-1,-408)
-- State  330
,( 12, 309),( 47, 304),( 48, 305),( 49, 306),( 50, 307),( 51, 308),(-1,-3000)
-- State  331
,(-1,-507)
-- State  332
,( 2, 351),(-1,-3000)
-- State  333
,(-1,-501)
-- State  334
,( 2, 352),(-1,-3000)
-- State  335
,( 296, 353),(-1,-3000)
-- State  336
,(-1,-80)
-- State  337
,(-1,-216)
-- State  338
,( 12,-101),( 52,-101),( 69,-101),( 70,-101),( 71,-101),( 72,-101),( 73,-101),( 74,-101),( 75,-101),( 76,-101),( 77,-101),( 78,-101),( 79,-101)
,( 80,-101),( 81,-101),( 82,-101),( 83,-101),( 84,-101),(-1,-100)
-- State  339
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  340
,( 38, 343),( 39, 344),( 40, 345),( 41, 346),( 42, 347),( 43, 348),(-1,-3000)
-- State  341
,(-1,-410)
-- State  342
,( 4, 358),( 38, 343),( 39, 344),( 40, 345),( 41, 346),( 42, 347),( 43, 348),(-1,-411)
-- State  343
,(-1,-414)
-- State  344
,(-1,-415)
-- State  345
,(-1,-416)
-- State  346
,(-1,-417)
-- State  347
,(-1,-418)
-- State  348
,(-1,-419)
-- State  349
,(-1,-403)
-- State  350
,(-1,-432)
-- State  351
,(-1,-508)
-- State  352
,(-1,-389)
-- State  353
,( 4, 362),(-1,-67)
-- State  354
,( 12, 375),( 52, 385),( 69, 376),( 70, 386),( 71, 387),( 72, 388),( 73, 378),( 74, 379),( 75, 380),( 76, 393),( 77, 394),( 78, 395),( 79, 396)
,( 80, 389),( 81, 390),( 82, 391),( 83, 392),( 84, 384),(-1,-3000)
-- State  355
,( 7, 127),( 15, 126),(-1,-3000)
-- State  356
,(-1,-406)
-- State  357
,(-1,-409)
-- State  358
,( 38, 343),( 39, 344),( 40, 345),( 41, 346),( 42, 347),( 43, 348),(-1,-3000)
-- State  359
,(-1,-413)
-- State  360
,( 6, 68),( 14, 67),(-1,-3000)
-- State  361
,( 4, 402),(-1,-3000)
-- State  362
,( 2, 403),(-1,-3000)
-- State  363
,(-1,-66)
-- State  364
,(-1,-103)
-- State  365
,(-1,-104)
-- State  366
,(-1,-105)
-- State  367
,(-1,-106)
-- State  368
,(-1,-107)
-- State  369
,(-1,-108)
-- State  370
,(-1,-109)
-- State  371
,(-1,-110)
-- State  372
,(-1,-111)
-- State  373
,(-1,-112)
-- State  374
,(-1,-113)
-- State  375
,(-1,-114)
-- State  376
,( 296, 405),(-1,-253)
-- State  377
,( 296, 407),(-1,-3000)
-- State  378
,(-1,-280)
-- State  379
,( 296, 407),(-1,-3000)
-- State  380
,( 296, 411),(-1,-308)
-- State  381
,( 296, 407),(-1,-3000)
-- State  382
,( 296, 407),(-1,-3000)
-- State  383
,( 296, 407),(-1,-3000)
-- State  384
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  385
,( 2, 50),( 292, 25),( 294, 24),( 296, 419),(-1,-3000)
-- State  386
,(-1,-277)
-- State  387
,(-1,-278)
-- State  388
,(-1,-279)
-- State  389
,(-1,-330)
-- State  390
,(-1,-331)
-- State  391
,(-1,-332)
-- State  392
,(-1,-333)
-- State  393
,(-1,-335)
-- State  394
,(-1,-336)
-- State  395
,(-1,-338)
-- State  396
,(-1,-339)
-- State  397
,( 12,-101),( 52,-101),( 69,-101),( 70,-101),( 71,-101),( 72,-101),( 73,-101),( 74,-101),( 75,-101),( 76,-101),( 77,-101),( 78,-101),( 79,-101)
,( 80,-101),( 81,-101),( 82,-101),( 83,-101),( 84,-101),(-1,-100)
-- State  398
,(-1,-52)
-- State  399
,( 4, 340),( 38, 343),( 39, 344),( 40, 345),( 41, 346),( 42, 347),( 43, 348),(-1,-408)
-- State  400
,(-1,-412)
-- State  401
,( 35, 193),( 36, 192),(-1,-395)
-- State  402
,( 2, 424),(-1,-3000)
-- State  403
,( 4, 425),(-1,-3000)
-- State  404
,( 2, 50),( 292, 25),( 294, 24),( 296, 426),(-1,-3000)
-- State  405
,( 4, 429),(-1,-3000)
-- State  406
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  407
,(-1,-385)
-- State  408
,( 4, 432),(-1,-255)
-- State  409
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  410
,( 4, 435),(-1,-300)
-- State  411
,( 4, 437),(-1,-3000)
-- State  412
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  413
,( 4, 439),(-1,-340)
-- State  414
,( 4, 439),(-1,-340)
-- State  415
,( 4, 439),(-1,-340)
-- State  416
,(-1,-383)
-- State  417
,( 4, 444),(-1,-372)
-- State  418
,(-1,-381)
-- State  419
,(-1,-382)
-- State  420
,(-1,-379)
-- State  421
,(-1,-102)
-- State  422
,(-1,-407)
-- State  423
,( 7, 127),( 15, 126),(-1,-3000)
-- State  424
,(-1,-390)
-- State  425
,( 2, 448),(-1,-3000)
-- State  426
,(-1,-119)
-- State  427
,(-1,-120)
-- State  428
,(-1,-115)
-- State  429
,(-1,-254)
-- State  430
,( 4, 432),(-1,-255)
-- State  431
,( 4, 451),(-1,-3000)
-- State  432
,( 2, 456),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 148, 470),( 149, 471),( 150, 472),( 151, 473)
,( 152, 474),( 153, 475),( 154, 477),( 155, 478),( 156, 485),( 157, 481),( 158, 482),( 159, 484),( 160, 476),( 161, 483),( 162, 479),( 163, 480),( 164, 486)
,( 165, 487),( 166, 488),( 167, 489),( 168, 457),( 169, 458),( 170, 459),( 171, 460),( 172, 461),( 173, 462),( 174, 465),( 175, 466),( 176, 467),( 177, 463)
,( 178, 464),( 179, 468),( 180, 469),(-1,-3000)
-- State  433
,(-1,-276)
-- State  434
,( 4, 491),(-1,-282)
-- State  435
,( 2, 494),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 181, 497),( 182, 498),( 183, 500),( 184, 502)
,( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510),( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517)
,( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520),( 204, 506),(-1,-3000)
-- State  436
,(-1,-299)
-- State  437
,(-1,-309)
-- State  438
,( 4, 522),(-1,-310)
-- State  439
,( 2, 527),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 181, 497),( 182, 498),( 183, 500),( 184, 502)
,( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510),( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517)
,( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520),( 204, 506),(-1,-3000)
-- State  440
,(-1,-329)
-- State  441
,( 4, 529),(-1,-212)
-- State  442
,(-1,-337)
-- State  443
,( 4, 531),(-1,-3000)
-- State  444
,( 2, 535),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 229, 533),(-1,-3000)
-- State  445
,(-1,-371)
-- State  446
,( 4, 537),(-1,-3000)
-- State  447
,(-1,-404)
-- State  448
,( 4, 538),(-1,-3000)
-- State  449
,( 4, 539),(-1,-3000)
-- State  450
,(-1,-252)
-- State  451
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  452
,( 5, 541),(-1,-257)
-- State  453
,(-1,-259)
-- State  454
,(-1,-260)
-- State  455
,(-1,-261)
-- State  456
,(-1,-262)
-- State  457
,(-1,-263)
-- State  458
,(-1,-264)
-- State  459
,(-1,-265)
-- State  460
,(-1,-266)
-- State  461
,(-1,-267)
-- State  462
,(-1,-268)
-- State  463
,(-1,-269)
-- State  464
,(-1,-270)
-- State  465
,(-1,-271)
-- State  466
,(-1,-272)
-- State  467
,(-1,-273)
-- State  468
,(-1,-274)
-- State  469
,(-1,-275)
-- State  470
,(-1,-232)
-- State  471
,(-1,-233)
-- State  472
,(-1,-234)
-- State  473
,(-1,-235)
-- State  474
,(-1,-236)
-- State  475
,(-1,-237)
-- State  476
,(-1,-238)
-- State  477
,(-1,-239)
-- State  478
,(-1,-240)
-- State  479
,(-1,-241)
-- State  480
,(-1,-242)
-- State  481
,(-1,-243)
-- State  482
,(-1,-244)
-- State  483
,(-1,-245)
-- State  484
,(-1,-246)
-- State  485
,(-1,-247)
-- State  486
,(-1,-248)
-- State  487
,(-1,-249)
-- State  488
,(-1,-250)
-- State  489
,(-1,-251)
-- State  490
,( 4, 529),(-1,-212)
-- State  491
,( 2, 546),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 205, 547),( 206, 548),( 207, 549),( 208, 550)
,( 209, 551),( 210, 553),( 211, 554),( 212, 555),( 213, 552),( 214, 556),(-1,-3000)
-- State  492
,(-1,-281)
-- State  493
,( 5, 558),(-1,-302)
-- State  494
,(-1,-304)
-- State  495
,(-1,-305)
-- State  496
,(-1,-306)
-- State  497
,(-1,-347)
-- State  498
,(-1,-348)
-- State  499
,(-1,-349)
-- State  500
,(-1,-350)
-- State  501
,(-1,-351)
-- State  502
,(-1,-352)
-- State  503
,(-1,-353)
-- State  504
,(-1,-354)
-- State  505
,(-1,-355)
-- State  506
,(-1,-356)
-- State  507
,(-1,-357)
-- State  508
,(-1,-358)
-- State  509
,(-1,-359)
-- State  510
,(-1,-360)
-- State  511
,(-1,-361)
-- State  512
,(-1,-362)
-- State  513
,(-1,-363)
-- State  514
,(-1,-364)
-- State  515
,(-1,-365)
-- State  516
,(-1,-366)
-- State  517
,(-1,-367)
-- State  518
,(-1,-368)
-- State  519
,(-1,-369)
-- State  520
,(-1,-370)
-- State  521
,( 4, 529),(-1,-212)
-- State  522
,( 2, 575),( 8, 567),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 215, 561),( 216, 562),( 217, 563),( 218, 564)
,( 219, 565),( 220, 566),( 221, 568),( 222, 569),( 223, 570),( 224, 571),( 225, 572),( 226, 573),(-1,-3000)
-- State  523
,(-1,-307)
-- State  524
,( 5, 577),(-1,-342)
-- State  525
,(-1,-344)
-- State  526
,(-1,-345)
-- State  527
,(-1,-346)
-- State  528
,(-1,-341)
-- State  529
,( 2, 248),( 279, 249),( 280, 251),( 281, 253),( 282, 254),( 283, 255),( 284, 252),( 285, 256),( 286, 257),( 287, 258),( 288, 260),( 289, 259),( 290, 261)
,( 291, 250),(-1,-3000)
-- State  530
,(-1,-334)
-- State  531
,( 2, 142),(-1,-3000)
-- State  532
,( 5, 580),(-1,-374)
-- State  533
,(-1,-376)
-- State  534
,(-1,-377)
-- State  535
,(-1,-378)
-- State  536
,(-1,-373)
-- State  537
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  538
,( 2, 582),(-1,-3000)
-- State  539
,( 2, 50),( 292, 25),( 294, 24),(-1,-3000)
-- State  540
,(-1,-386)
-- State  541
,( 2, 456),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 148, 470),( 149, 471),( 150, 472),( 151, 473)
,( 152, 474),( 153, 475),( 154, 477),( 155, 478),( 156, 485),( 157, 481),( 158, 482),( 159, 484),( 160, 476),( 161, 483),( 162, 479),( 163, 480),( 164, 486)
,( 165, 487),( 166, 488),( 167, 489),( 168, 457),( 169, 458),( 170, 459),( 171, 460),( 172, 461),( 173, 462),( 174, 465),( 175, 466),( 176, 467),( 177, 463)
,( 178, 464),( 179, 468),( 180, 469),(-1,-3000)
-- State  542
,(-1,-256)
-- State  543
,( 5, 585),(-1,-284)
-- State  544
,(-1,-286)
-- State  545
,(-1,-287)
-- State  546
,(-1,-288)
-- State  547
,(-1,-289)
-- State  548
,(-1,-290)
-- State  549
,(-1,-291)
-- State  550
,(-1,-292)
-- State  551
,(-1,-293)
-- State  552
,(-1,-294)
-- State  553
,(-1,-295)
-- State  554
,(-1,-296)
-- State  555
,(-1,-297)
-- State  556
,(-1,-298)
-- State  557
,( 4, 529),(-1,-212)
-- State  558
,( 2, 494),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 181, 497),( 182, 498),( 183, 500),( 184, 502)
,( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510),( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517)
,( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520),( 204, 506),(-1,-3000)
-- State  559
,(-1,-301)
-- State  560
,( 5, 588),(-1,-312)
-- State  561
,(-1,-314)
-- State  562
,(-1,-315)
-- State  563
,(-1,-316)
-- State  564
,(-1,-317)
-- State  565
,(-1,-318)
-- State  566
,(-1,-319)
-- State  567
,( 115, 322),( 117, 323),( 123, 324),( 124, 325),( 220, 589),(-1,-3000)
-- State  568
,(-1,-321)
-- State  569
,(-1,-322)
-- State  570
,(-1,-323)
-- State  571
,(-1,-324)
-- State  572
,(-1,-325)
-- State  573
,(-1,-326)
-- State  574
,(-1,-327)
-- State  575
,(-1,-328)
-- State  576
,( 4, 529),(-1,-212)
-- State  577
,( 2, 527),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 181, 497),( 182, 498),( 183, 500),( 184, 502)
,( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510),( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517)
,( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520),( 204, 506),(-1,-3000)
-- State  578
,( 4, 592),(-1,-213)
-- State  579
,(-1,-384)
-- State  580
,( 2, 535),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 229, 533),(-1,-3000)
-- State  581
,( 4, 432),(-1,-255)
-- State  582
,(-1,-68)
-- State  583
,(-1,-116)
-- State  584
,(-1,-258)
-- State  585
,( 2, 546),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 205, 547),( 206, 548),( 207, 549),( 208, 550)
,( 209, 551),( 210, 553),( 211, 554),( 212, 555),( 213, 552),( 214, 556),(-1,-3000)
-- State  586
,(-1,-283)
-- State  587
,(-1,-303)
-- State  588
,( 2, 575),( 8, 567),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 215, 561),( 216, 562),( 217, 563),( 218, 564)
,( 219, 565),( 220, 566),( 221, 568),( 222, 569),( 223, 570),( 224, 571),( 225, 572),( 226, 573),(-1,-3000)
-- State  589
,(-1,-320)
-- State  590
,(-1,-311)
-- State  591
,(-1,-343)
-- State  592
,( 293, 598),(-1,-3000)
-- State  593
,(-1,-375)
-- State  594
,(-1,-380)
-- State  595
,( 4, 599),(-1,-3000)
-- State  596
,(-1,-285)
-- State  597
,(-1,-313)
-- State  598
,(-1,-214)
-- State  599
,( 85, 266),( 86, 267),( 87, 268),( 88, 269),( 89, 270),( 90, 271),( 91, 272),( 92, 273),( 93, 274),( 94, 275),( 95, 276),( 96, 277),( 97, 278)
,( 98, 279),( 99, 280),( 100, 281),( 101, 282),( 102, 283),( 103, 284),( 104, 285),( 105, 286),( 106, 287),( 107, 288),( 108, 289),( 109, 290),( 110, 291)
,( 111, 292),( 112, 293),( 113, 294),( 114, 295),( 296, 265),(-1,-3000)
-- State  600
,(-1,-117)
-- State  601
,( 4, 602),(-1,-3000)
-- State  602
,( 2, 660),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 148, 470),( 149, 471),( 150, 472),( 151, 473)
,( 152, 474),( 153, 475),( 154, 477),( 155, 478),( 156, 485),( 157, 481),( 158, 482),( 159, 484),( 160, 476),( 161, 483),( 162, 479),( 163, 480),( 164, 486)
,( 165, 487),( 166, 488),( 167, 489),( 168, 457),( 169, 458),( 170, 459),( 171, 460),( 172, 461),( 173, 462),( 174, 465),( 175, 466),( 176, 467),( 177, 463)
,( 178, 464),( 179, 468),( 180, 469),( 181, 497),( 182, 498),( 183, 500),( 184, 502),( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510)
,( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517),( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520)
,( 204, 506),( 205, 547),( 206, 548),( 207, 549),( 208, 550),( 209, 551),( 210, 553),( 211, 554),( 212, 555),( 213, 552),( 214, 556),( 227, 609),( 228, 610)
,( 230, 614),( 231, 615),( 232, 611),( 233, 612),( 234, 613),( 235, 616),( 236, 617),( 237, 618),( 238, 619),( 239, 620),( 240, 621),( 241, 622),( 242, 623)
,( 243, 624),( 244, 625),( 245, 626),( 246, 628),( 247, 629),( 248, 630),( 249, 631),( 250, 632),( 251, 633),( 252, 634),( 253, 636),( 254, 637),( 255, 627)
,( 256, 635),( 257, 638),( 258, 639),( 259, 640),( 260, 641),( 261, 642),( 262, 643),( 263, 644),( 264, 645),( 265, 646),( 266, 647),( 267, 648),( 268, 649)
,( 269, 650),( 270, 652),( 271, 651),( 272, 653),( 273, 654),( 274, 655),( 275, 656),( 276, 657),( 277, 658),( 278, 659),(-1,-3000)
-- State  603
,( 5, 662),(-1,-153)
-- State  604
,(-1,-155)
-- State  605
,(-1,-156)
-- State  606
,(-1,-157)
-- State  607
,(-1,-158)
-- State  608
,(-1,-159)
-- State  609
,(-1,-160)
-- State  610
,(-1,-161)
-- State  611
,(-1,-162)
-- State  612
,(-1,-163)
-- State  613
,(-1,-164)
-- State  614
,(-1,-165)
-- State  615
,(-1,-166)
-- State  616
,(-1,-167)
-- State  617
,(-1,-168)
-- State  618
,(-1,-169)
-- State  619
,(-1,-170)
-- State  620
,(-1,-171)
-- State  621
,(-1,-172)
-- State  622
,(-1,-173)
-- State  623
,(-1,-174)
-- State  624
,(-1,-175)
-- State  625
,(-1,-176)
-- State  626
,(-1,-177)
-- State  627
,(-1,-178)
-- State  628
,(-1,-179)
-- State  629
,(-1,-180)
-- State  630
,(-1,-181)
-- State  631
,(-1,-182)
-- State  632
,(-1,-183)
-- State  633
,(-1,-184)
-- State  634
,(-1,-185)
-- State  635
,(-1,-186)
-- State  636
,(-1,-187)
-- State  637
,(-1,-188)
-- State  638
,(-1,-189)
-- State  639
,(-1,-190)
-- State  640
,(-1,-191)
-- State  641
,(-1,-192)
-- State  642
,(-1,-193)
-- State  643
,(-1,-194)
-- State  644
,(-1,-195)
-- State  645
,(-1,-196)
-- State  646
,(-1,-197)
-- State  647
,(-1,-198)
-- State  648
,(-1,-199)
-- State  649
,(-1,-200)
-- State  650
,(-1,-201)
-- State  651
,(-1,-202)
-- State  652
,(-1,-203)
-- State  653
,(-1,-204)
-- State  654
,(-1,-205)
-- State  655
,(-1,-206)
-- State  656
,(-1,-207)
-- State  657
,(-1,-208)
-- State  658
,(-1,-209)
-- State  659
,(-1,-210)
-- State  660
,(-1,-211)
-- State  661
,( 4, 663),(-1,-3000)
-- State  662
,( 2, 660),( 8, 227),( 115, 226),( 116, 229),( 117, 228),( 118, 230),( 119, 231),( 120, 232),( 121, 224),( 122, 225),( 123, 233),( 124, 234),( 125, 235)
,( 126, 236),( 127, 237),( 128, 238),( 129, 239),( 130, 240),( 131, 241),( 132, 242),( 133, 243),( 134, 244),( 148, 470),( 149, 471),( 150, 472),( 151, 473)
,( 152, 474),( 153, 475),( 154, 477),( 155, 478),( 156, 485),( 157, 481),( 158, 482),( 159, 484),( 160, 476),( 161, 483),( 162, 479),( 163, 480),( 164, 486)
,( 165, 487),( 166, 488),( 167, 489),( 168, 457),( 169, 458),( 170, 459),( 171, 460),( 172, 461),( 173, 462),( 174, 465),( 175, 466),( 176, 467),( 177, 463)
,( 178, 464),( 179, 468),( 180, 469),( 181, 497),( 182, 498),( 183, 500),( 184, 502),( 185, 503),( 186, 504),( 187, 505),( 188, 508),( 189, 512),( 190, 510)
,( 191, 511),( 192, 509),( 193, 513),( 194, 515),( 195, 507),( 196, 514),( 197, 517),( 198, 516),( 199, 499),( 200, 501),( 201, 518),( 202, 519),( 203, 520)
,( 204, 506),( 205, 547),( 206, 548),( 207, 549),( 208, 550),( 209, 551),( 210, 553),( 211, 554),( 212, 555),( 213, 552),( 214, 556),( 227, 609),( 228, 610)
,( 230, 614),( 231, 615),( 232, 611),( 233, 612),( 234, 613),( 235, 616),( 236, 617),( 237, 618),( 238, 619),( 239, 620),( 240, 621),( 241, 622),( 242, 623)
,( 243, 624),( 244, 625),( 245, 626),( 246, 628),( 247, 629),( 248, 630),( 249, 631),( 250, 632),( 251, 633),( 252, 634),( 253, 636),( 254, 637),( 255, 627)
,( 256, 635),( 257, 638),( 258, 639),( 259, 640),( 260, 641),( 261, 642),( 262, 643),( 263, 644),( 264, 645),( 265, 646),( 266, 647),( 267, 648),( 268, 649)
,( 269, 650),( 270, 652),( 271, 651),( 272, 653),( 273, 654),( 274, 655),( 275, 656),( 276, 657),( 277, 658),( 278, 659),(-1,-3000)
-- State  663
,( 2, 142),(-1,-3000)
-- State  664
,(-1,-154)
-- State  665
,( 4, 529),(-1,-212)
-- State  666
,(-1,-118)
);
--  The offset vector
SHIFT_REDUCE_OFFSET : array (0.. 666) of Integer :=
( 0,
 9, 10, 11, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
 32, 33, 45, 53, 57, 60, 63, 65, 66, 67, 69, 70, 71, 72, 73, 74,
 75, 78, 80, 88, 96, 97, 105, 113, 116, 124, 125, 126, 127, 128, 129, 130,
 131, 134, 135, 137, 139, 147, 148, 149, 157, 158, 159, 160, 161, 169, 172, 177,
 185, 189, 191, 192, 193, 198, 199, 203, 207, 208, 211, 214, 222, 223, 228, 229,
 230, 231, 232, 240, 241, 242, 243, 244, 245, 246, 247, 248, 253, 255, 256, 262,
 263, 264, 267, 268, 272, 274, 277, 278, 280, 285, 287, 290, 291, 296, 298, 299,
 300, 303, 304, 305, 306, 309, 312, 313, 314, 316, 317, 321, 322, 327, 328, 329,
 330, 331, 332, 333, 334, 336, 337, 340, 341, 346, 348, 349, 350, 353, 354, 355,
 356, 357, 361, 362, 365, 366, 369, 372, 375, 376, 377, 378, 379, 381, 382, 384,
 392, 395, 397, 398, 400, 401, 402, 403, 404, 407, 410, 412, 420, 421, 422, 423,
 424, 425, 426, 427, 429, 430, 466, 481, 485, 517, 518, 519, 522, 523, 524, 525,
 528, 530, 533, 540, 541, 544, 545, 548, 552, 553, 556, 560, 561, 562, 563, 565,
 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582,
 583, 584, 585, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602,
 603, 604, 605, 606, 607, 608, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619,
 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635,
 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651,
 652, 653, 654, 655, 656, 657, 658, 659, 660, 663, 664, 665, 666, 667, 668, 670,
 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 686, 688, 691, 693,
 695, 731, 732, 733, 734, 735, 750, 751, 753, 761, 768, 769, 771, 772, 774, 776,
 777, 778, 797, 801, 808, 809, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826,
 827, 829, 848, 851, 852, 853, 860, 861, 864, 866, 868, 869, 870, 871, 872, 873,
 874, 875, 876, 877, 878, 879, 880, 881, 883, 885, 886, 888, 890, 892, 894, 896,
 900, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 935, 936, 944,
 945, 948, 950, 952, 957, 959, 963, 964, 966, 970, 972, 974, 978, 980, 982, 984,
 985, 987, 988, 989, 990, 991, 992, 995, 996, 998, 999, 1000, 1001, 1002, 1004, 1006,
 1062, 1063, 1065, 1112, 1113, 1114, 1116, 1163, 1164, 1166, 1167, 1169, 1193, 1194, 1196, 1197,
 1199, 1201, 1202, 1206, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219,
 1220, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235,
 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1243, 1244, 1245, 1247, 1280, 1281, 1283, 1284, 1285,
 1286, 1287, 1288, 1289, 1290, 1291, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301,
 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1312, 1347, 1348, 1350, 1351, 1352, 1353,
 1354, 1369, 1370, 1372, 1374, 1375, 1376, 1377, 1378, 1382, 1384, 1388, 1389, 1445, 1446, 1448,
 1449, 1450, 1451, 1452, 1453, 1454, 1455, 1456, 1457, 1458, 1459, 1460, 1461, 1463, 1510, 1511,
 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1533,
 1535, 1582, 1584, 1585, 1609, 1611, 1612, 1613, 1614, 1647, 1648, 1649, 1684, 1685, 1686, 1687,
 1689, 1690, 1691, 1693, 1694, 1695, 1696, 1728, 1729, 1731, 1872, 1874, 1875, 1876, 1877, 1878,
 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893, 1894,
 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910,
 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926,
 1927, 1928, 1929, 1930, 1931, 1933, 2074, 2076, 2077, 2079);
end Rc_Shift_Reduce;