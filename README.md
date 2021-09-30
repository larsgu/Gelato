# Docker solution loosely based on "Selenium Cucumber Docker"
A Selenium standalone container with chrome and vnc
A ruby 3.0 container for executing the tests

## Quick start
Open a terminal in root directory and follow these steps:
```
docker-compose run ruby bash
# May take a while. The terminal is now 'inside' the ruby container. 

gem install bundler
bundle install
# To ensure we have the required gems installed

bundle exec cucumber features/*.feature --publish
# To execute the tests

# For viewing the tests executing connect to the browser container via VNC 
# The password is 'secret'. Can be opened via a separate terminal:
open vnc://:secret@0.0.0.0:5900

# The test results will be available in the terminal and at the link presented at the end of the tests.
# After completion, exit out of the container:
exit

#From the host terminal stop the containers:
docker-compose down --remove-orphans


