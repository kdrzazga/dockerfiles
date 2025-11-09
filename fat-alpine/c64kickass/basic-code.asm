.const rem = $8f
.const end = $80
.const newline = $08
.const sys = $9e
.const print = 153
.const for = 129
.const next = 130
.const space = 32
.const quote = 34
.const i = 73
.const equal = 178
.const one = 49
.const colon = 58
.const poke = $9700
.const signature_basic = $180d


*=2049 "basic loader"
.byte 24, 8
.byte 245, 0
.byte  print
.byte $00,0,$19

.byte 246, 0
.byte  print,32, quote
.text "TRIBUTE TO BLACKBOX CART"
.byte quote
.byte $00,0,$19

.byte 250, 0, for
.text " I "
.byte 178 //2057
.byte 32, 49, 32, 164, 32  //2063
.text "4000 : "
.byte  next
.byte 0,0,$19

.byte 251, 0
.byte sys
.text " 4444"
.byte $00,$19
.byte $00, $00
