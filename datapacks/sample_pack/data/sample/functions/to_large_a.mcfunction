###小文字のaを大文字のAに変換する

#前準備…小文字のaをストレージに代入する。
data modify storage minecraft:test small set value "a"


#ストレージの中身を、アマスタが右手に持っているアイテムのtag.inputに代入する
data modify entity @e[tag=Sample,limit=1] HandItems[0].tag.input set from storage minecraft:test small

#ルートテーブルで、アマスタの左手に条件にあったアイテム(tag.output:"A"が入っている)を与える
execute as @e[tag=Sample,limit=1] run loot replace entity @e[tag=Sample,limit=1] weapon.offhand loot sample:to_large_a

#アマスタの左手にあるアイテムのtag.outputをストレージに代入しておわり
data modify storage minecraft:test large set from entity @e[tag=Sample,limit=1] HandItems[1].tag.output


###データの確認方法
#上の4つのコマンドを実行する各段階で下2つのコマンドを実行するとデータの流れがわかりやすいかもしれません
#/data get storage minecraft:test  …実行したらストレージに入っているデータが参照できます
#/data get entity @e[tag=Sample,limit=1] HandItems  …実行したらアマスタが持っているアイテムのデータが参照できます
