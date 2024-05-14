# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


source: https://www.youtube.com/watch?v=nrYg7ldwOzM&list=PLdTytUiloS14Ncm2egAwyh2gLPe_aaNF4&index=1




6e526a209927276120bf17c01c503aaa

curl -X GET localhost:3000/api/v1/home/index.json -H "Authorization: Bearer 6e526a209927276120bf17c01c503aaa"

curl -X GET localhost:3000/posts.json -H "Authorization: Bearer eab533196e3236e51a1964389f71b3ed"

curl -X GET localhost:3000/api/v1/posts.json -H "Authorization: Bearer bf0ca3233347bbb38b93faf101d59690"

curl -X DELETE -H "Content-Type: application/json"  "localhost:3000/users/sign_out"

curl -X POST -H "Content-Type: application/json" -d '{"post": {"title": "via api"}}' localhost:3000/api/v1/posts -H "Authorization: Bearer 6e526a209927276120bf17c01c503aaa"

curl -X PATCH -H "Content-Type: application/json" -d '{"post": {"body": "yet another post11111"}}'  localhost:3000/api/v1/posts/5 -H "Authorization: Bearer 6e526a209927276120bf17c01c503aaa"

curl -X DELETE -H "Content-Type: application/json"  localhost:3000/api/v1/posts/5 -H "Authorization: Bearer 6e526a209927276120bf17c01c503aaa"


eab533196e3236e51a1964389f71b3ed