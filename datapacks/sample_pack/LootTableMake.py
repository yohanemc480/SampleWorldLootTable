#五十音を数値に直すルートテーブルを生成する
JapaneseLetters = ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]#五十音の配列

import os
Indention = '\n'
PathBase = os.path.dirname(__file__) + '/'#このファイルがあるディレクトリ

def Write(Content,Path):#パスと書き込み内容を指定して、ファイル内容の書き込みをする。
  Path = PathBase + Path
  with open(Path,'w') as WriteFile:
    WriteFile.write(Content)
def Read(Path):#指定したパスにあるファイル内容を返す
  Path= PathBase + Path
  with open(Path,'r') as ReadFile:
    Content = ReadFile.read()
    return Content

def MakeLetterToNumberLootTable():#五十音を対応する数値に変換するルートテーブル
  LootTableBase = Read('Resources/LootTableBase.txt')#リソースの読み込み
  LootTableModule = Read('Resources/LootTableModule.txt')
  Modules = []

  for Element in JapaneseLetters:#五十音1文字ごとの処理
    Module = LootTableModule.replace('入力',r'\"' + Element + r'\"').replace('出力',str(JapaneseLetters.index(Element) + 1))
    Modules.append(Module)
  
  Modules = ','.join(Modules)
  Content = LootTableBase.replace('アイテム候補',Modules)
  Write(Content,'data/sample/loot_tables/letter_to_number.json')


def MakeTimeLootTable():#時刻を含むコマンドログを時刻の配列に変換するルートテーブル
  LootTableBase = Read('Resources/LootTableBase.txt')#リソースの読み込み
  LootTableModule = Read('Resources/LootTableModule.txt')
  CommandLogTemprate = r"{\"extra\":[{\"text\":\"/help [<command>]\"}],\"text\":\"[時:分:秒] \"}"
  Hour, Minute, Second = 24, 60 ,60

  for H in range(Hour):
    Modules = []
    for M in range(Minute):
      for S in range(Second):
        strH , strM, strS = str(H),str(M),str(S)
        if 0 <= H <= 9:#一桁の数字の前に0を入れる
          strH = '0' + str(H)
        if 0 <= M <= 9:#一桁の数字の前に0を入れる
          strM = '0' + str(M)
        if 0 <= S <= 9:#一桁の数字の前に0を入れる
          strS = '0' + str(S)

        Input = CommandLogTemprate.replace('時',strH).replace('分',strM).replace('秒',strS)
        Output = str([H,M,S])
        Module = LootTableModule.replace('入力','\'' + Input + '\'').replace('出力',Output)
        Modules.append(Module)
    Modules = ','.join(Modules)
    Content = LootTableBase.replace('アイテム候補',Modules)
    Write(Content,'data/sample/loot_tables/time/' + str(H) + '.json')

        


#関数を実行する
MakeLetterToNumberLootTable()
MakeTimeLootTable()