###ルートテーブルの変換のために使用するものの初期化

###エンティティ
#アマスタを1体召喚し、右手に石を持たせる
kill @e[tag=Sample]
summon minecraft:armor_stand 3.5 38.00 2.5 {Tags:["Sample"],Invulnerable:1b,Marker:1b}
data modify entity @e[tag=Sample,limit=1] HandItems[0] set value {id:"minecraft:stone",Count:1b}

###ストレージ
data modify storage minecraft:test small set value ""
data modify storage minecraft:test large set value ""
data modify storage minecraft:test letter set value ""
data modify storage minecraft:test number set value ""
data modify storage minecraft:test time set value []

###スコアボード
scoreboard objectives remove Time
scoreboard objectives add Time dummy
scoreboard objectives setdisplay sidebar Time