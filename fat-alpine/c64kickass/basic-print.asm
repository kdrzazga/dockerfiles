.const rem = $8f
.const end = $80
.const newline = $08
.const sys = $9e00
.const for = 129
.const space = 32
.const i = 73
.const equal = 178
.const one = 49
.const poke = $9700
.const print = 153
.const quote = 34
//.const signature_basic = $180d
.const signature_basic = $1308


*=2049 "basic loader"
.word signature_basic
.byte 245, 0, print, 32, quote
.text " 01234567"
.byte quote
.byte  0,0,73
