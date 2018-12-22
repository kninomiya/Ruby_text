require 'open-uri'

open("https://support.sugutsukaeru.jp/ja/troubleshooting/installation/1/3-500-internal-server-error-is-a-black-box.png") { |image|
  File.open("test.jpg","wb") do |file|
    file.puts image.read
  end
}