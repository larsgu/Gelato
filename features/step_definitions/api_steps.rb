# require 'selenium-cucumber'
require 'page-object'
require 'rest-client'
require 'json'

class APIPage
  include PageObject

  page_url("https://jsonplaceholder.typicode.com")
  expected_title "JSONPlaceholder - Free Fake REST API"

end

Given(/^I send a request to "([^"]*)" for all users$/) do |arg|
  @response =  RestClient.get "http://jsonplaceholder.typicode.com/users", content_type: :json, accept: :json
end

Then(/^I should get a response with the users$/) do
  parsed_response =   JSON.parse(@response)
  all = parsed_response[0].map do |key,value|
    value != nil
  end
  if all.all?
    puts "all good"
  else
    raise "empty fields"
  end
end

Given(/^I send a POST request to "([^"]*)" with user "([^"]*)"$/) do |arg1, arg2|
  $r = RestClient.post "http://jsonplaceholder.typicode.com/users", {
    body: {
      name: arg2,
      username: 'NumberOne',
      email: 'adam@paradise.com',
      address: {
        street: 'apple road',
        suite: 'cave 23',
        city: 'Paradise City',
        zipcode: '1',
      },
      phone: '0176-10333',
      website: 'apple.com',
      company: 'Apple',
      catchPhrase: 'Second to none',
      bs: 'No',
      },
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    }
    }
end

Then(/^I should get a response with the new user "([^"]*)"$/) do |arg1|
  expect($r.body).to include(arg1)
end

And(/^there should be a (\d+) status code$/) do |arg1|
  expect($r.code).to eq(arg1)
end