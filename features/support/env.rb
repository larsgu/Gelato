require 'cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'selenium/server'
require 'rest-client'
require 'json'
require 'rspec'

$BASE_URL = "https://todomvc.com/examples/react/#/"

#get IP of host which has 4444 mapped from other container
# docker_ip = %x(/sbin/ip route|awk '/default/ { print $3 }').strip

url = "http://gelato_browser:4444/wd/hub"
driver = Selenium::WebDriver.for :remote, url: url, capabilities: :chrome

Before do
  @driver = driver
  @driver.navigate.to($BASE_URL)
end

After do

end

at_exit do
  begin
    driver.quit
  rescue Exception => e
    puts e.message
    Process.exit( 0 )
  end
end