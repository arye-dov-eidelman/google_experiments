require_relative "google_experiments/version"
require_relative "google_experiments/cli"
require_relative "google_experiments/page"
require_relative "google_experiments/homepage"
require_relative "google_experiments/category"
require_relative "google_experiments/experiment"
require_relative "google_experiments/scraper"

require 'pry'
require 'open-uri'
require 'nokogiri'
require 'launchy'

module GoogleExperiments
  SCRAPER = Scraper.new
end
