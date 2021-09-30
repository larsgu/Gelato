class ToDoPage
  include PageObject

  page_url("https://todomvc.com/examples/react/#/")
  expected_title "React • TodoMVC"

  text_field(:new_todo_field, :class =>'new-todo')

  label(:first_item, :xpath =>"(//label[normalize-space()])[1]")
  checkbox(:first_item_done, :xpath=>".//*[@class='todo-list']/li[1]/div/input")
  button(:first_item_delete, :xpath =>"(//button[@class='destroy'])[1]")
  label(:second_item, :xpath =>"(//label[normalize-space()])[2]")
  checkbox(:second_item_done, :xpath=>".//*[@class='todo-list']/li[2]/div/input")
  button(:second_item_delete, :xpath =>"(//button[@class='destroy'])[2]")
  label(:third_item, :xpath =>"(//label[normalize-space()])[3]")
  checkbox(:third_item_done, :xpath=>".//*[@class='todo-list']/li[3]/div/input")
  button(:third_item_delete, :xpath =>"(//button[@class='destroy'])[3]")

  def enter_item_name(itemName)
    action.send_keys(new_todo_field, itemName + "\n").perform
  end
end

Given(/^I go to "(.*?)"$/) do |arg1|
  @driver.navigate.to($BASE_URL)
  @driver.manage.window.maximize
  @page = ToDoPage.new(@driver, true)
end

When(/^I enter item name "(.+)" into the new item input field$/) do |itemName|
  sleep(1)
  @page.enter_item_name(itemName)
  sleep(1)
end

Then(/^the \#(\d+) item element should have text as "([^"]*)"$/) do |itemNumber, itemName|
  case itemNumber
  when 1
    expect(@page.first_item).to eq(itemName)
  when 2
    expect(@page.second_item).to eq(itemName)
  when 3
    expect(@page.third_item).to eq(itemName)
  end
end

When(/^I check the checkbox for item \#(\d+)$/) do |itemNumber|
  case itemNumber
  when 1
    @page.check_first_item_done
  when 2
    @page.check_second_item_done
  when 3
    @page.check_third_item_done
  end
 end

 Then(/^the checkbox should be checked for item \#(\d+)$/) do |itemNumber|
   case itemNumber
   when 1
     expect(@page.first_item_done_checked?).to eq(true)
   when 2
     expect(@page.second_item_done_checked?).to eq(true)
   when 3
     expect(@page.third_item_done_checked?).to eq(true)
   end
 end

 When(/^I uncheck the checkbox for item \#(\d+)$/) do |itemNumber|
   case itemNumber
   when 1
     @page.uncheck_first_item_done
   when 2
     @page.uncheck_second_item_done
   when 3
     @page.uncheck_third_item_done
   end
 end

 Then(/^the checkbox should be unchecked for item \#(\d+)$/) do |itemNumber|
   case itemNumber
   when 1
   expect(@page.first_item_done_checked?).to eq(false)
   when 2
     expect(@page.second_item_done_checked?).to eq(false)
   when 3
     expect(@page.third_item_done_checked?).to eq(false)
   end
 end

 When(/^I delete item \#(\d+)$/) do |itemNumber|
   sleep(1)
   case itemNumber
   when 1
     sleep(0.2)
     @page.first_item_delete
   when 2
     @page.second_item_delete
   when 3
     @page.third_item_delete
   end
 end

 Then(/^the \#(\d+) item should not be present$/) do |itemNumber|
   case itemNumber
   when 1
     expect(@driver.find_elements(:xpath, ".//*[@class='todo-list']/li[1]/div/label").size).to eq(0)
   when 2
     expect(@driver.find_elements(:xpath, ".//*[@class='todo-list']/li[2]/div/label").size).to eq(0)
   when 3
     expect(@driver.find_elements(:xpath, ".//*[@class='todo-list']/li[3]/div/label").size).to eq(0)
   end
 end

Then(/^the \#(\d+) item element should not have text as "([^"]*)"$/) do |itemNumber, itemName|
  case itemNumber
  when 1
    expect(@page.first_item).to_not eq(itemName)
  when 2
    expect(@page.second_item).to_not eq(itemName)
  when 3
    expect(@page.third_item).to_not eq(itemName)
  end
end

Then(/^the second item element should have text as "(.+)"$/) do |itemName|
  expect(@page.second_item).to eq(itemName)
end

