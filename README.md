# Simple

For education

教育用で大幅な割り切りといくつかの脆弱性には目をつぶっているので本番環境では絶対に利用しないでください．

## install

    gem install sinatra
    gem install sqlite3

## running

    ruby main.rb

## schema

    CREATE TABLE posts (
      id INTEGER PRIMARY KEY,
      text TEXT,
      img_file_name TEXT,
      star_count INTEGER default 0
    );
