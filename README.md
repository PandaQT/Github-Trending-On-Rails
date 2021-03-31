
# Github-Trending-On-Rails

## Description

A simple Ruby on Rails application that implements basic user model, with following functionality create, edit, delete and login sessions.
While logged in Users can search for currently trending developers on github.

This feature depends on the github-trending-api project by huchenme.

Checkout https://github.com/huchenme/github-trending-api/ for more details

## Requirements

Make sure you have the following installed


| Application	| Version	| Download  	|
|:-------------:|:-------------:|:-------------|
| Ruby      	| 3.0.0 	| https://www.ruby-lang.org/de/documentation/installation/ |
| Ruby on Rails | 6.1.3 	| https://guides.rubyonrails.org/v5.0/getting_started.html
| PostgresSQL   | 12.6 	    | https://www.postgresql.org/download|
| Node      	| 12.21.0 	| https://nodejs.org/en/download/ |
| yarn      	| 1.22.5 	| https://yarnpkg.com/getting-started/install |
| PostgreSQL    | 12.6 	    | https://www.postgresql.org/download|

## Installation

Clone the github-trending-api project
```
git clone https://github.com/huchenme/github-trending-api.git
```
Clone the Github-Trending-On-Rails project
```
git clone https://github.com/PandaQT/Github-Trending-On-Rails.git
```
to install missing project dependencies run 
```
cd Github-Trending-On-Rails
yarn install jquery popper.js
bundle install
```
## Usage

Start up the api 
```
cd github-trending-api
yarn start
```
Start the rails server
```
cd Github-Trending-On-Rails
rails s
```

Open the browser of your choice and visit localhost:3000 

