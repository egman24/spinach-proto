##
## Test suite runtime hooks
## https://github.com/codegram/spinach/blob/master/lib/spinach/hooks.rb
##

#TODO: Test just calling browser from before_run and closing at after_run, may speed up tests and catch related state bugs?

require 'watir-webdriver'

# Runs before the entire spinach run
Spinach.hooks.before_run do
  #binding.pry
  $screen = Screenshot.new
end

# Runs before every feature
# feature_data is a hash of the parsed feature data
Spinach.hooks.before_feature do |feature_data|
  #binding.pry
  $screen.feature_title = feature_data.name
end

# Runs before every scenario
# feature_data is a hash of the parsed scenario data
Spinach.hooks.before_scenario do |scenario|
  #binding.pry
  $browser               = Watir::Browser.new $BROWSER_TYPE
  $screen.browser        = $browser
  $screen.scenario_title = scenario.name
  $screen.create_subdirectories
end

# Runs before every step execution
# step_data contains a hash with this step's data
Spinach.hooks.before_step do |step_data, step_definitions|
  #binding.pry
  $screen.step_title = step_data.name
end

# Runs after every step execution
# step_data contains a hash with this step's data
Spinach.hooks.after_step do |step_data, step_definitions|
  #binding.pry
end

# Runs after every successful step execution
# step_data contains a hash with this step's data
# step_location contains a string indication this step definition's location
Spinach.hooks.on_successful_step do |step_data, location, step_definitions|
  #binding.pry
end

# Runs after every failed step execution
# step_data contains a hash with this step's data
# step_location contains a string indication this step definition's location
Spinach.hooks.on_failed_step do |step_data, exception, location, step_definitions|
  #binding.pry
end

# Runs after every scenario
# feature_data is a hash of the parsed scenario data
Spinach.hooks.after_scenario do |scenario_data, step_definitions|
  #binding.pry
  $browser.close
end

# Runs after every feature
# feature_data is a hash of the parsed feature data
Spinach.hooks.after_feature do |feature_data|
  #binding.pry
end

# Runs after the entire spinach run
# status is true when the run is successful, false otherwise
Spinach.hooks.after_run do |status|
  #binding.pry
  STDOUT.puts ""
  STDOUT.puts "==> Would you like the report to be generated with this sessions screenshots?"
  #TODO: when finished with steps below, encapsulate this into one clean method for the hooks run
  #TODO: create CLI reponse prompt to decide to creat the report now or later (if later, give the command to do so)
  #TODO: add methods or rake task to setup proper report then output the url (include ssh location to scp to automatically?)
end