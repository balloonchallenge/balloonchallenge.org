# GSBC

luke@simplyluke.com | [@_simplyluke](https://twitter.com/_simplyluke)

## Setting up the project


    git clone https://github.com/balloonchallenge/balloonchallenge.org.git

    # get rails gems

    bundle install

    # set up the database

    rake db:create
    rake db:migrate

### Get environment variables set up

`application.yml` is where sensitive environment variables live, it's in .gitignore to keep API Keys & Passwords out of source control

    mv config/example.application.yml config/applicaton.yml

If you need to send emails for any reason from the test app you'll need to update application.yml with your gmail credentials

## Running the project

    # start the server
    rails s
    # run tests/livereload
    guard


Write tests if you're doing any kind of logic.