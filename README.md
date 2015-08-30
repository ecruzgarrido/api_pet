**API Pets** API for pets battle.

## Install project

1. Required environment
  * Required ruby version: ```2.2.1```, if we don't have it, we should execute ```rvm install 2.2.1```
  * Required rubygems version: ```2.4.6```, if we don't have it, once ruby is installed we should execute
  ```rvm rubygems 2.4.6```
  * Create a gemset for the project:, we should execute ```rvm ruby-2.2.1@api_pet --create```
  * Create a ```.ruby-version``` file in the root folder with the content ```ruby-2.2.1```
  * Create a ```.ruby-gemset``` file in the root folder with the content ```api_pet```
  * Finally, we should see something like this when executing ```gem env```:

  ```
  RubyGems Environment:
    - RUBYGEMS VERSION: 2.4.6
    - RUBY VERSION: 2.2.1 (2015-02-26 patchlevel 85) [x86_64-darwin14]
    - INSTALLATION DIRECTORY: /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@api_pet
    - RUBY EXECUTABLE: /Users/enrique_cruz_garrido/.rvm/rubies/ruby-2.2.1/bin/ruby
    - EXECUTABLE DIRECTORY: /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@api_pet/bin
    - SPEC CACHE DIRECTORY: /Users/enrique_cruz_garrido/.gem/specs
    - SYSTEM CONFIGURATION DIRECTORY: /etc
    - RUBYGEMS PLATFORMS:
      - ruby
      - x86_64-darwin-14
    - GEM PATHS:
       - /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@api_pet
       - /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@global
    - GEM CONFIGURATION:
       - :update_sources => true
       - :verbose => true
       - :backtrace => false
       - :bulk_threshold => 1000
    - REMOTE SOURCES:
       - https://rubygems.org/
    - SHELL PATH:
       - /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@api_pet/bin
       - /Users/enrique_cruz_garrido/.rvm/gems/ruby-2.2.1@global/bin
       - /Users/enrique_cruz_garrido/.rvm/rubies/ruby-2.2.1/bin
       - /Users/enrique_cruz_garrido/.rvm/bin
       - /usr/local/bin
       - /usr/bin
       - /bin
       - /usr/sbin
       - /sbin
  ```

2. Installation
  * Install rails: ```gem install rails -v 4.2.4```
  * Install bundler: ```gem install bundler -v 1.10.62```
  * Install rvm gem: ```gem install rvm -v 1.11.3```
  * Install rake: ```gem install rake -v 10.4.2```
  * Execute bundler: ```bundle install --path vendor```
  * Add database host name:
    * Edit file ```/etc/hosts```
    * Add the following line: ```127.0.0.1  database```
  * Create database and its structure: ```bundle exec rake db:create && bundle exec rake db:schema:load```

## Execute project

  * We're using ```Foreman``` in order to run our project you only need to execute: ```foreman start```
  this should run the following processes:
    * WEBrick server
  * Once ```Foreman``` is running we can execute seeds to populate the database:
    * Execute seed:
      * ```rake db:seed```

## Running tests

  * Create test database: ```bundle exec rake db:test:prepare```
  * Run the suite: ```bundle exec rake spec```

  We recommend using zeus for a lot of tasks in the project, for example: running server, console..., to use it you should
  install the zeus gem (```gem install zeus -v 0.15.4```) and run the zeus process (```zeus start```).

## Populate database with test data

  It is possible to create some test data in order to avoid the need of manually create it, this can be done executing:

  ```bundle exec rake db:seed```

  This will create some test users and pets, you can access the app with users:
  * user: user_1@example.com
  * password: 12345678

  * user: user_2@example.com
  * password: 12345678

  * user: user_3@example.com
  * password: 12345678

  * user: user_4@example.com
  * password: 12345678

  This will create an admin, you can access the admin zone with (http://localhost:3000/admin/login):
  * user: admin@example.com
  * password: password