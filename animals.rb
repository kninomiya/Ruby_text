#配列animalsを宣言・初期化
#!/usr/local/bin/ruby

require 'open-uri'

# 配列animalsを宣言・初期化
animals = []
   begin
     open("https://gist.githubusercontent.com/uneco/5856580/raw/bc117e88b6d4e45fc1e65cac277c1184a65486cd/animal.txt") do |file|
       fileContents = file.read()
       animals = fileContents.split("\n")
  rescue => error
    puts ファイルを読み込めませんでした。
  end

# 標準出力から検索する文字列を読み込む
  class output
    def 
      p '検索したい動物の名前を入力してください。
      input gets()
      p 検索中...
    end

#読み込んだ文字列を使って検索する
  class retrieval
    def search()
      results = animals.index("input")

     
    end
  end


#検索結果を出力する

