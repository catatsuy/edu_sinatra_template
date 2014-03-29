require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new "db/test.db"
db.results_as_hash = true

get '/' do
  posts = db.execute("SELECT id, text, img_file_name FROM posts ORDER BY ID DESC LIMIT 10")
  erb :example, locals: { posts: posts }
end

post '/' do
  stmt = db.prepare("INSERT INTO posts (text, img_file_name) VALUES (?, ?)")
  stmt.bind_params(params["ex-text"], "koko.jpg")
  stmt.execute
  redirect '/'
end
