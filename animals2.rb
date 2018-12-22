#!/usr/local/bin/ruby

require "open-uri"

class Animals
  attr_accessor :data_url

  def initialize(data_url)
    @data_url = data_url
  end

  def run()
    puts "開始"
    keyword = readKeyword()

    puts "検索中..."
    result = search(keyword)

    puts "------"
    puts "検索結果"
    result[:list].each{|animal|
      puts "\t#{animal}"
    }
    puts "------#{result[:count]}件"
    puts "完了"
  end

  private
  def readKeyword()
    print "文字を入力してください。"
    input = gets()
    return input.strip!
  end

  private
  def search(keyword)
    search_result = { :count => 0, :list => [] }

    begin

      # open
      open(@data_url) do |file|
        file_contents = file.read()

        animals = file_contents.split("\n")
        count = 0

        for animal in animals do

           # keyword matching
           if animal.include?(keyword) then

             # increment
             count += 1

             # add list
             search_result[:list].push(animal)
           end
        end

        # set count
        search_result[:count] = count
      end

      return search_result
    # begin/rescue
    rescue OpenURI::HTTPError => e

      # error log and exit
      puts %Q(class=[#{e.class}] message=[#{e.message}])
      exit(false)
    end
  end
end
