require 'sinatra'
require 'sqlite3'
require "securerandom"

db = SQLite3::Database.new "db/test.db"
db.results_as_hash = true

get '/' do
  posts = db.execute("SELECT id, text, img_file_name FROM posts ORDER BY ID DESC LIMIT 10")
  erb :example, { :locals => { :posts => posts } }
end

post '/' do
  file_name = nil

  if params["file"]
    # Content Type は信用ならないが，教育用のために妥協
    # Content Type から拡張子を決定して適当な名前で保存
    ext = ""
    if params["file"][:type].include? "jpeg"
      ext = "jpg"
    elsif params["file"][:type].include? "png"
      ext = "png"
    else
      return "error"
    end

    # 適当なファイル名を付ける
    file_name = "#{SecureRandom.hex}.#{ext}"
    save_path = "./public/images/#{file_name}"
    File.open(save_path, 'wb') do |f|
      f.write params["file"][:tempfile].read
    end
  end

  stmt = db.prepare("INSERT INTO posts (text, img_file_name) VALUES (?, ?)")
  stmt.bind_params(params["ex-text"], file_name)
  stmt.execute
  redirect '/'
end
