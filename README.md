# scholify

A free and open source application developed to manage scholarship fundings

## How to setup locally
- Checkout this repo
- In the root of the project,
- `bundle install`
- If the mysql server is not running then `mysql.server start`
- `rails s`

## How to access the page locally
- http://localhost:3000/

## How to deploy to heroku
- heroku login (enter credentials)
- heroku git:remote -a scholify
- Commit your code
- git push heroku master
- run the migration script. heroku run rake db:migrate
- add GOOGLE_CLIENT_ID and GOOGLE_SECRET to heroku config vars
- to view heroku logs. heroku logs -t

## How to deploy to heroku
- https://scholify.herokuapp.com 

## How to setup google oath
- Go to https://console.developers.google.com/iam-admin/projects
- Go to credentials
- Select project scholify