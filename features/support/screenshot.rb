class Screenshot

  attr_accessor :screenshot_directory, :screenshot_archive, :screenshot_archive_directory,
                :feature_title, :scenario_title, :step_title,
                :feature_directory, :scenario_directory,
                :browser

  def initialize
    @screenshot_directory         = $SCREENSHOT_DIRECTORY
    @screenshot_archive           = $SCREENSHOT_ARCHIVE
    @screenshot_archive_directory = $SCREENSHOT_ARCHIVE_DIRECTORY

    init_screenshot_directory
  end

  def create_subdirectories
    @feature_directory  = "#{self.screenshot_directory}/#{sanitize_filename(self.feature_title)}"
    @scenario_directory = "#{self.feature_directory}/#{sanitize_filename(self.scenario_title)}"
    find_or_create_directory(self.feature_directory)
    find_or_create_directory(self.scenario_directory)
  end

  def snapshot
    directory = "#{self.scenario_directory}/"
    timestamp = "#{Time.now.strftime('%H%M%S%L%N')}__"
    step      = "#{sanitize_filename(self.step_title)}.png"
    file = directory + timestamp + step
    browser.screenshot.save file
  end

  private

  def init_screenshot_directory
    Dir::mkdir(self.screenshot_archive) if not File.directory?(self.screenshot_archive)
    Dir::mkdir(self.screenshot_archive_directory) if not File.directory?(self.screenshot_archive_directory)
    FileUtils.mv(self.screenshot_directory, self.screenshot_archive_directory) if File.directory?(self.screenshot_directory)
    Dir::mkdir(self.screenshot_directory) if not File.directory?(self.screenshot_directory)
  end

  def find_or_create_directory(directory)
    Dir::mkdir(directory) if not File.directory?(directory)
  end

  def sanitize_filename(name)
    name.downcase
        .gsub(/ /, '_')
        .gsub(/\(|\)/, '')
        .gsub(/:/, '_')
        .gsub(/'/, '')
        .gsub(/-/,'_')
  end

end