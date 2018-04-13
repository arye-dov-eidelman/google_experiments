require "google_experiments/version"
require "google_experiments/cli"
require "google_experiments/page"
require "google_experiments/homepage"
require "google_experiments/category"
require "google_experiments/experiment"
require "google_experiments/scraper"

require 'pry'
require 'open-uri'
require 'nokogiri'
require 'launchy'

module GoogleExperiments
  SCRAPER = Scraper.new
end
