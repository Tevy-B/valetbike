# Prototype for ValetBike
Smith College CSC223: Introduction to Software Engineering\
Group EEEee: Grace Li, Sethatevy Bong, Winnie Zong, Liwen Xu, Yanning Tan\
Visit our valetbike page @ https://valetbikeeeeee.herokuapp.com

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
* You should see ValetBike welcome page!

## Frequent Encountered Questions
1. The `USERNAME=your_own_sql_username PASSWORD=your_own_sql_password` should successfully setup the credential,\
but if there is still a `Access denied for user 'root'@'localhost' (using password: YES)` error:\
Try to add /config/initializers/_env.rb in your app with your mysql username/password like this:\
`ENV['MYSQL_USERNAME'] = "your_own_sql_username"`\
`ENV['MYSQL_PASSWORD'] = "your_own_sql_password"`

## Functionality
* **User management (enabled by `devise gem`):** The user can sign up by clicking the link in the navigation bar. When entering email information, there must be an `@` in the email address. When setting a password the length of the password has to be more than 6 characters and the reentered password has to be the same as the original one. The user can then login using the email address and the password to login. After logging in, the user can use the sign out button to sign out and they can also use the edit profile button to edit their email address and password.

* **Interactive Map:** Users can view the map in the `Display Stations and Bikes` page. Users can find bike stations that they intend to visit on the map by selecting a station, obtain its corresponding `Station ID` (listed below the map), and clicking on the marker with that number locating on the map. A pop-up box at the upper right corner of the screen will offer information of that station, including the station name, its address, a `Direction` feature, and a `Borrow a bike here` link. By selecting the `Direction` button, users will be redirected to a typical interactive Google Map platform, where they can use Google Map features such as estimating the direction, distance, mode of transportation, and time taken to get to their desired bike station. As users select the `Borrow a bike here` link, they will be redirected to the selected station's borrow page and check the bike availabilities and accessibly borrow or return a bike.

* **Customer Service:** At the top nav bar of the main page, there’s a buttom named `Customer Services` that will lead the user to a page that has the contact information of ValetBike. If the user click the email, it will automatically copy the email and jump to the email page. The use can also call us or leave message in the feedback box. 

* **Borrow & Return:** After clicking on the `Display Stations and Bikes`, a list of stations will be shown. On each station, there is a link `show bike`, which will navigate the user to the specific dock. In each dock a list of bikes(with current station id same as the id of the station) will appear. Users could click the `Borrow the Bike!` link to borrow the bike by typing in the bike identifier(only the identifiers of bikes within the station will work). Users could also click the “Return the Bike” and type in the bike identifier to return the bike in any station they want.

* **Billing:** After clicking on `Go buy some credits to borrow a bike!` on the borrow bike page or clicking on the `Creits:` in the nav bar, you will be allowed to chose from three types of membership plan. Two ways of billing will be allowed: mastercard or VISA. After clicking on the payment option you choose, users are required to input their payment information(membership plan, holder name, card number, cvv, expiration date), these input can not be empty. The card number and cvv can only be numbers with length no more than 16 for card number and 3 for cvv. After inputting proper value, the information will be stored and the user will see “You successfully input billing information. Thank you!!!” and will be able to get to the home page. On the `Credits: ` in the nav bar, you will also see your credits amount increase by the number of cresits you just bought.

## Recommended Walkthrough
* Start with the welcome page.
* Create an account by clicking **“Sign up”** in the nav bar. After successfully creating the account, it will automatically log you in (you can try logout and login using the account you just created).
* Click on **“Display station and bike”** in the nav bar, view the interactive map and the stations below, you will see each station’s id, name and address by either clicking on the station below or clicking the **red pin** on the map.
* Click into a station(either by clicking on the station below or clicking the red pin on the map), click on **“Go buy some credits to borrow a bike!”**, click on the membership type you prefer. Try fillin the billing information and submit. Then you can go back to the homepage by clicking “Back to homepage”. You will see your credit increase in the nav bar. By clicking on **"Credits: "** in the nav bar, you can also go to the billing page.
* Click into station 1, click on **“Borrow the Bike!”** to borrow a bike using identifier code “7522” (the identifier codes supposed to appear on real bikes). Click confirm. Click continue. Return to the station and observe if the bike count decreases by one.
* Click on any station, click on **“Return the Bike”**, return the bike by entering the identifier code “7522”. Return to the station and observe if the bike count increases by one. Observe if your credit decreases by certain amount(1 credit for 15 minutes).
* Click on **“Customer service”** in the nav bar, and try some message input.
* Click on **“Edit profile”** in the nav bar, try to update your password. Try to sign out and log in again with the new password.
* That's it! Feel free to explore more!

## Changes We Have Made Since The Prototype
* **Customer Service:** made the email a link so that if the user click the link, it will automatically copy the email and launch one Email Client installed on the user's computer; made the message box larger to handle longer message.
*  **Interactive Map:** with our latest pop-up menus, user can find a redirect link, `Click to borrow a bike there!`, to each station’s specific borrow bike page. This new change allow users to easily and accessibly check the availability and borrow our bikes. 
* **Membership:** add a membership function which allows users to select type of membership and buy different amounts of credits. The amount of credit is shown in `Credits: ` in the nav bar. Each credit allows the user to borrow a bike for 15 minutes. When the user borrow a bike, the system will start counting how long the user has borrowed it. When users return the bike, the amount of credits will decrease base on the lenth of time they borrow. Users can not borrow bikes when they have zero or negative amount of credit.
* **Styling:** Add involving front end to our web app so that the user could use the app more conviently and find it interesting interacting with our web app!
* **User Profile:** allow users to create their personal profile, display biking history, borrow status, and balance(credits).

## Next Step
* **Make the front page mobile first**
* Add FAQ and News page
* Add multiple languages
* Color-blind friendly
* Integrate social media apps
* User testing plans

