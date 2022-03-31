###五十音を、対応する数字に変換する(あ→1,い→2,う→3…)

#前準備…"か"をストレージに代入する。
data modify storage minecraft:test letter set value "か"


#ストレージの中身を、アマスタが右手に持っているアイテムのtag.inputに代入する
data modify entity @e[tag=Sample,limit=1] HandItems[0].tag.input set from storage minecraft:test letter

#ルートテーブルで、アマスタに対して左手にアイテム(tag.output:6が入っている)を与える
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:letter_to_number

#アマスタの左手にあるアイテムのtag.outputをストレージに代入しておわり
data modify storage minecraft:test number set from entity @e[tag=Sample,limit=1] HandItems[1].tag.output


###データの確認方法
#上の4つのコマンドを実行する各段階で下2つのコマンドを実行するとデータの流れがわかりやすいかもしれません
#/data get storage minecraft:test  …実行したらストレージに入っているデータが参照できます
#/data get entity @e[tag=Sample,limit=1] HandItems  …実行したらアマスタが持っているアイテムのデータが参照できます