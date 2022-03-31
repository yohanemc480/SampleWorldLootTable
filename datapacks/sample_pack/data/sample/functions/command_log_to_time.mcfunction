###コマンドブロックから時刻を取得する

#前準備…エラーを吐き続けるコマンドブロックを設置する
setblock 4 37 2 minecraft:repeating_command_block{Command:"/help help",TrackOutput:1b,auto:1b}

#コマンドブロックのログ(LastOutput)を、アマスタが右手に持っているアイテムのtag.inputに代入する
data modify entity @e[tag=Sample,limit=1] HandItems[0].tag.input set from block 4 37 2 LastOutput

#ルートテーブルで、アマスタに対して左手にアイテム(tag.output:[時,分,秒]が入っている)を与える
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/0
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/1
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/2
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/3
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/4
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/5
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/6
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/7
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/8
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/9
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/10
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/11
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/12
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/13
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/14
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/15
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/16
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/17
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/18
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/19
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/20
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/21
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/22
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:time/23


#アマスタの左手にあるアイテムのtag.outputをストレージに代入する
data modify storage minecraft:test time set from entity @e[tag=Sample,limit=1] HandItems[1].tag.output

#時、分、秒、それぞれをストレージからスコアボードに代入する
execute store result score $Hour Time run data get storage minecraft:test time[0]
execute store result score $Minute Time run data get storage minecraft:test time[1]
execute store result score $Second Time run data get storage minecraft:test time[2]


###データの確認方法
#上の4つのコマンドを実行する各段階で下2つのコマンドを実行するとデータの流れがわかりやすいかもしれません
#/data get block 4 37 2   …実行したらコマンドブロックに入っているデータが参照できます(使うのはLastOutputのみ)
#/data get storage minecraft:test  …実行したらストレージに入っているデータが参照できます
#/data get entity @e[tag=Sample,limit=1] HandItems  …実行したらアマスタが持っているアイテムのデータが参照できます