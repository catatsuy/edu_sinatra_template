# Simple

For education

教育用で脆弱性には目をつぶっているので本番環境で利用しないでください

## install

    bundle install

## running

    bundle exec ruby main.rb

## schema

    CREATE TABLE posts (
      id INTEGER PRIMARY KEY,
      text TEXT,
      img_file_name TEXT
    );
