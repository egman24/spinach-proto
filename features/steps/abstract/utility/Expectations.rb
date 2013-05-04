module Utility::Expectations
  require_relative 'expectations/Locations'
  require_relative 'expectations/Messages'

  include Utility::Expectations::Locations
  include Utility::Expectations::Messages
end