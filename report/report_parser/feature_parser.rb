class FeatureParser
  require 'haml'

  attr_accessor :file_name, :feature_name, :scenario_names, :topics

  def initialize(file)
    STDERR.puts "  Processing: #{file}"

    @file           = File.open(file, "r")
    @file_name      = File.basename(@file).gsub(/\.feature/, '')
    @feature_name   = ''
    @scenario_names = []
    @topics         = []
    @elements       = []

    parse
  end

  private

  def parse
    @file.each_line do |line|
      line = line.chomp

      case
        when line.match(/^@.*/)
          _tag(line)
        when line.match(/^Feature:.*/)
          _feature(line)
        when line.match(/^..#.Topics.*/)
          _topic(line)
        when line.match(/^..As.*/)
          _as(line)
        when line.match(/^..I.*/)
          _i(line)
        when line.match(/^..So.*/)
          _so(line)
        when line.match(/^Scenario.*/)
          _scenario(line)
          @scenario_names << line
        when line.match(/^..Given.*/)
          _given(line)
        when line.match(/^..When.*/)
          _when(line)
        when line.match(/^..And.*/)
          _and(line)
        when line.match(/^..Then.*/)
          _then(line)
        when line.match(/^..Examples.*/)
          _examples(line)
        when line.match(/^#.NOTE:.*/)
          _note(line)
        when line.match(/^..\|.*/)
          _table(line)
        when line.match(/^## Test Cases.*/)
          _testcases(line)
        when line.match(/^\s*$/)
          _space(line)
      end
    end
  end

  def _feature(line)
    @feature_name = line.gsub(/Feature: /, '')
  end

  def _topic(line)
    @topics = line.gsub(/  # Topics:/, '').split(',')
  end

  def _as(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/user_stories/as.haml")

    if line.end_with?("administrator")
      element[:value] = { :article     => 'an',
                          :type        => 'administrator',
                          :description => "User with access to administrative interface."}
    elsif line.end_with?("guest user")
      element[:value] = { :article     => 'a',
                          :type        => 'guest user',
                          :description => "User who has not yet registered."}
    elsif line.end_with?("registered user")
      element[:value] = { :article     => 'a',
                          :type        => 'registered user',
                          :description => "User who has an active account stored in the database."}
    elsif line.end_with?("domestic user")
      element[:value] = { :article     => 'a',
                          :type        => 'domestic user',
                          :description => "User who has an active account stored in the database; has registered with a \'domestic country\' selection."}
    elsif line.end_with?("international user")
      element[:value] = { :article     => 'an',
                          :type        => 'international user',
                          :description => "User who has an active account stored in the database; has registered with a \'international country\' selection."}
    elsif line.end_with?("customer support representative")
      element[:value] = { :article     => 'a',
                          :type        => 'customer support representative',
                          :description => "User with access to customer support administrative tools."}
    elsif line.end_with?("external LMS admin")
      element[:value] = { :article     => 'an',
                          :type        => 'external LMS administrator',
                          :description => "User with administrative access to their own external LMS."}
    elsif line.end_with?("external LMS user")
      element[:value] = { :article     => 'an',
                          :type        => 'external LMS user',
                          :description => "User with user access to external LMS."}
    end

    @elements << element
  end

  def _i(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/user_stories/i.haml")


    element[:value] = { :text => "#{line.gsub(/  /, '')}" }
    @elements << element
  end

  def _so(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/user_stories/so.haml")


    element[:value] = { :text => "#{line.gsub(/  /, '')}" }
    @elements << element
  end

  def _scenario(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'scenario',
                        :title => 'Scenario:',
                        :text  => "#{line.gsub(/Scenario: /, '')}"}
    @elements << element
  end

  def _given(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'given',
                        :title => 'Given',
                        :text  => "#{line.gsub(/Given /, '')}"}
    @elements << element
  end

  def _when(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'when',
                        :title => 'When',
                        :text  => "#{line.gsub(/When /, '')}"}
    @elements << element
  end

  def _and(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'and',
                        :title => 'And',
                        :text  => "#{line.gsub(/And /, '')}"}
    @elements << element
  end

  def _then(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'then',
                        :title => 'Then',
                        :text  => "#{line.gsub(/Then /, '')}"}
    @elements << element
  end

  def _examples(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'scenario',
                        :title => 'Example:',
                        :text  => ''}
    @elements << element
  end

  def _note(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'note',
                        :title => 'NOTE:',
                        :text  => "#{line.gsub(/# NOTE: /, '')}"}
    @elements << element
  end

  def _table(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/scenario.haml")

    element[:value] = { :type  => 'given',
                        :title => '',
                        :text  => "#{line}"}
    @elements << element
  end

  def _tag(line)

  end

  def _testcases(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/testcases.haml")

    element[:value] = {}
    @elements << element
  end

  def _space(line)

    element = {}
    element[:file] = File.read("templates/atomic_elements/space.haml")

    element[:value] = {}
    @elements << element
  end

end