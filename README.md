# Github-Trending-On-Rails

## Description

Github-Trending-On-Rails is a Ruby on Rails application which implements a basic user model allowing a User to create, modify, delete and view his account.
While logged in Users can search for currently trending developers on GitHub, however this feature requires the github-trending-api project.

Checkout https://github.com/huchenme/github-trending-api/ for more details.

## Requirements

Make sure you have the following installed

| Application	| Version	    | Download 	                                               |
|:-------------:|:-------------:|:---------------------------------------------------------|
| Ruby 	        | 3.0.0 	    | https://www.ruby-lang.org/de/documentation/installation/ |
| Ruby on Rails | 6.1.3.1 	    | https://guides.rubyonrails.org/v5.0/getting_started.html |
| PostgreSQL    | 12.6          | https://www.postgresql.org/download                      |
| Node 	        | 12.21.0 	    | https://nodejs.org/en/download/                          |
| yarn 	        | 1.22.5 	    | https://yarnpkg.com/getting-started/install              |

## Installation

Clone the github-trending-api project
```
git clone https://github.com/huchenme/github-trending-api.git
```
To install missing project dependencies
```
cd github-trending-api
yarn install
```

Clone the Github-Trending-On-Rails project
```
git clone https://github.com/PandaQT/Github-Trending-On-Rails.git
```
To install missing project dependencies
```
cd Github-Trending-On-Rails
yarn install
bundle install
```
## Usage

Start up the API 
```
cd github-trending-api
yarn start
```

On first time setup

```
cd Github-Trending-On-Rails
rails db:setup      
rails dev:cache
rails s
```

On any consecutive start 

```
cd Github-Trending-On-Rails
rails s
```
will suffice.

Open the browser of your choice and visit localhost:3000 

![Homepage](https://puu.sh/HxHUI/465172ae4c.png =600x)

## Tests

To run all tests

```
cd Github-Trending-On-Rails
rails test
```

To run only a specific type of test

```
rails test:models
rails test:controllers
```
