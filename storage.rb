require "google/cloud/storage"

storage = Google::Cloud::Storage.new(
    project_id: "polynomial-net-212709",
    credentials: "/Users/ninomiyakouichirou/RubymineProjects/key/My First Project-78cf42cd92b2.json"
)

# bucket名を入力
bucket_name = "ninomiya_bucket"

# bucketを指定
bucket = storage.bucket bucket_name

bucket.create_file "/Users/ninomiyakouichirou/RubymineProjects/rails-training-image-search/rails-training-image-search/test.jpg",
                   "/screenshot/test.jpg",
# content_type: cover_image.content_type,
acl: "public"


# ファイルを作成した上でアップロード
# bucket.create_file StringIO.new("Hello world!"), "hello-world.txt"

# 指定されたファイルのアップロード:ローカル:元ディレトトリ,アップロード先
# ※アップロード先を指定しないと元ディレクトリのパスのままフォルダが作成されてしまう
# bucket.create_file "/Users/ninomiyakouichirou/Desktop/screenshots/test.rtf"

# ネットワーク上からダウンロードしてきた場合は多分こっち？
# bucket.create_file StringIO.new("Hello world!"), "hello-world3.txt"

# file = bucket.file "/Users/ninomiyakouichirou/Desktop/screenshots/test.rtf"

# 前がファイル名の場所、後ろがアップロード先
# bucket = storage.bucket "ninomiya-attachments"
# bucket.create_file Images,"test.png"


# Download the file to the local file system
# file.download "/tasks/attachments/#{file.name}"

# Copy the file to a backup bucket
# backup = storage.bucket "task-attachment-backups"
# file.copy backup, file.name



#
# #csv = <<__CSV__
# 1,日本語,aaa
# 2,,bbb
# 3,ほげ,ccc
# 4,時間,#{Time.now.to_s}
#     __CSV__
#
# title = "google_drive_api_test-1"
#
# Tempfile.open([title, ".csv"]) do |file|
#   file << csv # [下準備] ファイルを作る
#
#   session = GoogleDrive.login_with_oauth("xxxxxxxxxxxxxxxx")
#   session.upload_from_file(file, title)
# end