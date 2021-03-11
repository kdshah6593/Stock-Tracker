# Stock Tracker
This is the documentation for the Stock Tracker web app developed as a Rails project for Flatiron School

## Description
Stock Tracker is a web application developed using Ruby on Rails incorporating CRUD and MVC principles. This web app is intended for users to keep track of their many stock portfolios in one place maintain watchlists, and view stock information. Currently, stocks listed are only from the S&P500.

This app was developed using `ruby 2.6.1` and `Rails 6.1`

<a href="https://iexcloud.io">Data provided by IEX Cloud</a>

## Installation
To use this app, clone this repo: `$ git clone https://github.com/kdshah6593/Stock-Tracker`

## Usage

After cloning, access the directory `$ cd stock-tracker` (if nested under other directories be sure to include those in the path)

Run `$ npm install --global yarn` to install Yarn if it's not on your system.

Run `$ bundle install` to add dependencies

Run `$ rails db:migrate` and `$ rails db:seed` to create and seed the database with the basic stock information

If you want to see some stock data, you will need an API token. Create a `.env` file and inside the file create a variable `STOCK_API_KEY` and set it equal to this publishable token `pk_ae03a9a1eff1404ea36816acf676a716`. Or you can get your own API token from [IEX Cloud](https://iexcloud.io).

Start the server `$ rails s` and open your browser to `localhost:3000`

NOTE: Github Login will not work in Development unless you create a `.env` file and provide a Github Key and Secret on your own

## Contributing
Stretch goals in progress are listed in the [Notes.md](https://github.com/kdshah6593/Stock-Tracker/blob/main/Notes.md)

Bug reports and pull requests are welcome on GitHub at https://github.com/kdshah6593/Stock-Tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Code of Conduct](https://github.com/kdshah6593/Stock-Tracker/blob/main/CODE_OF_CONDUCT.md).

## License
This Rails App is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stock-Tracker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [Code of Conduct](https://github.com/kdshah6593/Stock-Tracker/blob/main/CODE_OF_CONDUCT.md).