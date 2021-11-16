# Prototype for ValetBike
Smith College CSC223: Introduction to Software Engineering\
Group EEEee: Grace Li, Tevy Bong, Winnie Zong, Liwen Xu, Yanning Tan

## General Configuration
1. Install MySQL 8.0.26
* Download: https://dev.mysql.com/downloads/mysql
* Choose "Use Legacy Password Encryption"
* After install make sure you add `/usr/local/mysql/bin` (or equivalent) to your path

2. Install Ruby 3.0.2
* Start here: https://www.ruby-lang.org/en/documentation/installation
* asdf is recommended for *nix systems, more info available on request
* Make sure you are using Ruby 3.0.2 before proceeding

3. Install Rails 6.1.4
* `gem install rails --version 6.1.4`

4. Install MySQL gem
* `gem install mysql2`

5. Clone our ValetBike repo
* `git clone https://github.com/Tevy-B/valetbike.git`

6. Install gems
* `cd valetbike`
* `bundle install`

7. Prepare database in MySQL
* `mysql -u root -p`
* `CREATE DATABASE valetbike_development;`
* run `mysql -u root -p valetbike_development < valetbike_development.sql` to import database

8. Run database migrations
* `rake db:migrate`

9. Confirm app runs
* `USERNAME=your_own_sql_username PASSWORD=your_own_sql_password  rails s`
* Open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* You should see ValetBike welcome page

## Frequent Encountered Questions
1. The `USERNAME=your_own_sql_username PASSWORD=your_own_sql_password` should successfully setup the credential,\
but if there is still a `Access denied for user 'root'@'localhost' (using password: YES)` error:\
Try to add /config/initializers/_env.rb in your app with your mysql username/password like this:\
`ENV['MYSQL_USERNAME'] = "your_own_sql_username"`\
`ENV['MYSQL_PASSWORD'] = "your_own_sql_password"`
