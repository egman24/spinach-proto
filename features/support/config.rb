module ApplicationConfig
  require_relative 'config_secure'

  #General

  $BROWSER_TYPE      = :chrome                              # :firefox, :ie, :safari...
  $WEBSITE           = "http://0.0.0.0:3000"                # "http://qa.aha.scitent.com"
  $EXTERNAL_LMS      = "http://scitentmoodle.com"
  $DATABASE          = 'qa'                                 # database name
  $DATABASE_HOST     = '0.0.0.0'                            # local database; could be remote application database like scidea@aha.scitent.com...
  $DATABASE_USERNAME = $QA_USERNAME                         # via ApplicationConfigSecure (file in .gitignore)
  $DATABASE_PASSWORD = $QA_PASSWORD                         # via ApplicationConfigSecure (file in .gitignore)
  $FILESYSTEM        = '../scidea/scidea-aha/public/system' # relatively placed near application's filesystem; may need rsync/ssh if testing remote application


  #Dependencies (uat/features/support/dependencies)

  $PACKAGE_AICC                = './support/dependencies/assets/packages/aicc/QuickTestCourse.zip'

  #Screenshots

  $SCREENSHOT_DIRECTORY         = 'report/uat/screenshots'
  $SCREENSHOT_ARCHIVE           = 'tmp/screenshots_archive'
  $SCREENSHOT_ARCHIVE_DIRECTORY = "tmp/screenshots_archive/#{Time.now.strftime('%Y-%m-%d_%H%M%S')}"

  #Registration

  ## TODO read in files from application dir if they exist (do the short circut ||, 'read file as array or take the test version')

  COUNTRIES_DOMESTIC      = ['United States', 'Puerto Rico', 'Guam', 'American Samoa'] #pull in countries from the textfile 'new countries.txt' and traverse the structure to pull out what i need
  COUNTRIES_INTERNATIONAL = ['Aruba', 'Australia', 'Austria'] #pull in countries from the textfile 'new countries.txt' and traverse the structure to pull out what i need
  COUNTRIES_ALL           = COUNTRIES_DOMESTIC | COUNTRIES_INTERNATIONAL
  SALUTATIONS             = %w(Dr. Mrs. Mr. Ms.)

end