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


# Stock Tracker

## Description
Stock Tracker is a web application developed using Rails incorporating CRUD and MVC principles. The application can sign up and login users that can add workouts to their profile. Per individual workout, a user can add exercises. Users can view others exercises as well. 

<a href="https://iexcloud.io">Data provided by IEX Cloud</a>

## Usage

To use this app, clone this repo, 'cd' into the directory, run 'bundle install', run 'rake db:migrate' and then run 'shotgun'. Everything will already be set up. 

NOTE: When you run 'shotgun' your terminal may say it is ignoring certain gems because "extensions are not built". It will tell you to try: 'gem pristine gem_name --version x.x.xx'. Exit shotgun with 'ctrl+C'. Then use that command for each gem it refers to you in the terminal to restore the gem. Then re-run 'shotgun' and everything should work. 

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/kdshah6593/Stock-Tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kdshah6593/Stock-Tracker/blob/main/CODE_OF_CONDUCT.md).

## License
This Rails App is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LolChampions project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kdshah6593/Stock-Tracker/blob/main/CODE_OF_CONDUCT.md).