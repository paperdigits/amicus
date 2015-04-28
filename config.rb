# site config
set :site_title, 'Site Title'
set :site_author, 'Site Author'
set :site_language, 'en-us'
set :site_url, 'http://example.com'
set :site_description, 'Site Description'
set :site_keywords, 'keywords, home page'

# gem configs

###
# middleman-livereloader
###
activate :livereload

###
# Compass
###

# Susy grids in Compass
require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Haml
###

# Set haml format to HTML5
set :haml, { :format => :html5 }

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# kramdown
###

set :markdown_engine, :kramdown
set :markdown, :layout_engine => :haml, 
               :tables => true, 
               :autolink => true,
               :smartypants => true

###
# Page command
###

# Per-page layout changes:
#
# With no layout
### With no layout
page "404.html", directory_index: false, :layout => false
page "robots.txt", directory_index: false, :layout => false
page "humans.txt", directory_index: false, :layout => false

# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end

  # Holder.js image placeholder helper
  def img_holder(opts = {})
    return "Missing Image Dimension(s)" unless opts[:width] && opts[:height]
    return "Invalid Image Dimension(s)" unless opts[:width].to_s =~ /^\d+$/ && opts[:height].to_s =~ /^\d+$/

    img  = "<img data-src=\"holder.js/#{opts[:width]}x#{opts[:height]}/auto"
    img << "/#{opts[:bgcolor]}:#{opts[:fgcolor]}" if opts[:fgcolor] && opts[:bgcolor]
    img << "/text:#{opts[:text].gsub(/'/,"\'")}" if opts[:text]
    img << "\" width=\"#{opts[:width]}\" height=\"#{opts[:height]}\">"

    img
  end

end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Change the fonts directory
# set :fonts_dir,  "alternative_fonts_directory"

# Build-specific configuration
configure :build do

  # Requires middleman-favicon-maker
  # activate :favicon_maker,
  #   :favicon_maker_base_image => "favicon_base.svg"

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  ###
  # middleman-favicon-maker		
  ###

  activate :favicon_maker, :icons => {
    "favicon_base.svg" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-144x144-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
    ]
  }

#  activate :favicon_maker,
#    :favicon_maker_base_image => "favicon_base.svg"

  ###
  # middleman-smusher
  ###
  # Compress PNGs after build
  activate :smusher
end # build

###
# middleman-deploy; requires rsync
###
# Requires middleman-deploy and rsync
# activate :deploy do |deploy|
#   deploy.method = :rsync
#   deploy.user   = "example"
#   deploy.host   = "www.example.com"
#   deploy.path   = "/public_html"
#   # Optional Settings
#   deploy.port  = 22 # ssh port, default: 22
#   deploy.clean = true # remove orphaned files on remote host, default: false
#   deploy.build_before = true # default: false
# end

# Skip locale validation (and validation warnings)
I18n.enforce_available_locales = false
