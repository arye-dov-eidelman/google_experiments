require "google_experiments/version"
require "google_experiments/cli"
require "google_experiments/homepage"
require "google_experiments/category"
require "google_experiments/experiment"
require "google_experiments/scraper"
require "google_experiments"

require 'pry'
require 'open-uri'
require 'nokogiri'

module GoogleExperiments
  SCRAPER = Scraper.new
end
