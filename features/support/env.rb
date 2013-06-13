#Rails environment references: https://github.com/codegram/spinach-rails#usage
#ENV['RAILS_ENV'] = 'production'
#require_relative '../../../scidea/scidea-aha/config/environment'

require 'rspec-expectations'           # https://github.com/rspec/rspec-expectations
require 'page-object'
require 'faker'
require 'pry-debugger'
require 'require_all'                  # https://github.com/jarmo/require_all

include PageObject::PageFactory        # https://github.com/cheezy/page-object/wiki/Creating-and-using-page-objects
