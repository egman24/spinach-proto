module Utility
  require_relative 'utility/Navigation'
  require_relative 'utility/Dependencies'
  require_relative 'utility/Expectations'

  include Utility::Navigation
  include Utility::Dependencies
  include Utility::Expectations
end
