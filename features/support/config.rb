module ApplicationConfig

  #General

  $WEBSITE      = "http://0.0.0.0:3000"      # "http://qa.aha.scitent.com"
  $EXTERNAL_LMS = "http://scitentmoodle.com"
  $BROWSER_TYPE = :chrome                    # :firefox, :ie, :safari...

  #Dependencies (uat/features/support/dependencies)

  $PACKAGES_AICC                = './support/dependencies/assets/packages/aicc/QuickTestCourse.zip'

  #Screenshots

  $SCREENSHOT_DIRECTORY         = 'uat_report/images/screenshots'
  $SCREENSHOT_ARCHIVE           = 'tmp_resources/screenshots_archive'
  $SCREENSHOT_ARCHIVE_DIRECTORY = "tmp_resources/screenshots_archive/#{Time.now.strftime('%Y-%m-%d_%H%M%S')}"

  #Registration

  ## TODO read in files from application dir if they exist (do the short circut ||, 'read file as array or take the test version')

  COUNTRIES_DOMESTIC      = ['United States', 'Puerto Rico', 'Guam', 'American Samoa'] #pull in countries from the textfile 'new countries.txt' and traverse the structure to pull out what i need
  COUNTRIES_INTERNATIONAL = ['Aruba', 'Australia', 'Austria'] #pull in countries from the textfile 'new countries.txt' and traverse the structure to pull out what i need
  COUNTRIES_ALL           = COUNTRIES_DOMESTIC | COUNTRIES_INTERNATIONAL
  SALUTATIONS             = %w(Dr. Mrs. Mr. Ms.)

end