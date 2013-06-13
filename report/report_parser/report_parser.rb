class ReportParser
  require 'fileutils'
  require_relative 'feature_parser.rb'
  require 'haml'

  attr_reader   :file_names, :feature_titles, :feature_identifiers, :feature_files, :feature_template_file

  def initialize
    @template_file          = File.read("templates/uat.haml")
    @feature_template_file  = File.read("templates/single_feature.haml")
    @feature_files          = Dir.glob("../../features/*.feature").sort
    @file_names             = retrieve_file_names
    @feature_titles         = retrieve_feature_titles
    @feature_identifiers    = @file_names.zip(@feature_titles)
  end

  def render_file
    prep_environment
    engine      = Haml::Engine.new(@template_file)
    output_file = File.new("../uat/uat.html", "w+")

    output_file.puts(engine.render())
  end

  private

  def prep_environment
    archive_existing_report
    transfer_assets
  end

  def archive_existing_report
    existing_file     = "../uat/uat.html"
    archive_directory = "../../tmp/reports_archive"
    archive_file      = "#{archive_directory}/uat_#{Time.now.strftime('%Y-%m-%d_%H%M%S')}.html"
    Dir::mkdir(archive_directory) if not File.directory?(archive_directory)
    FileUtils.mv(existing_file, archive_file) if File.exists?(existing_file)
  end

  def transfer_assets
    tmp_images        = '../uat/images/'
    tmp_javascripts   = '../uat/javascripts/'
    tmp_stylesheets   = '../uat/stylesheets/'
    asset_images      = './assets/images/'
    asset_javascripts = './assets/javascripts/'
    asset_stylesheets = './assets/stylesheets/'

    FileUtils.rm_rf(tmp_images)      if File.exists?(tmp_images)
    FileUtils.rm_rf(tmp_javascripts) if File.exists?(tmp_javascripts)
    FileUtils.rm_rf(tmp_stylesheets) if File.exists?(tmp_stylesheets)

    FileUtils.cp_r(asset_images, tmp_images)
    FileUtils.cp_r(asset_javascripts, tmp_javascripts)
    FileUtils.cp_r(asset_stylesheets, tmp_stylesheets)
  end

  def retrieve_file_names
    file_names = []

    @feature_files.each do |file|
      file_name  =  file.chomp.gsub(/\.\.\/features\//, '').gsub(/\.\.\//, '').gsub(/\.feature/, '')
      file_names << file_name
    end
    return file_names
  end

  def retrieve_feature_titles
    feature_titles = []

    @feature_files.each do |file|
      feature_title  =  File.open(file) {|f| f.readline.chomp.gsub(/Feature: /, '')}
      feature_titles << feature_title
    end
   return feature_titles
  end

end


################################
## Executes the proper method ##
################################

ReportParser.new.render_file