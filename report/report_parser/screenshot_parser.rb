class ScreenshotParser

  attr_accessor :template, :feature_name, :scenario_names

  def initialize(feature_name, scenario_names)
    @template = File.read('./templates/screenshots.haml')
    @feature_name = feature_name.split("\n")
                                .first
                                .downcase
                                .gsub(/ /, '_')
                                .gsub(/\(|\)/, '')
                                .gsub(/:/, '_')
                                .gsub(/'/, '')
                                .gsub(/-/,'_')
    @scenario_names = scenario_names.map do |name|
      name.gsub(/Scenario: /, '')
          .downcase
          .gsub(/ /, '_')
          .gsub(/\(|\)/, '')
          .gsub(/:/, '_')
          .gsub(/'/, '')
          .gsub(/-/,'_')
    end
  end

end