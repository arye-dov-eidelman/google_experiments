# notes

[ 1 ] Level 1: On the welcome page the user will be shown a numbered list of all the experiment categories with a short description (Scraper, Homepage and CLI classes)

  [ 1.1 ] cli (fake data) - instantiates scraper and homepage object

  [ 1.2 ] homepage (fake data) - stores all data from the home page

  [ 1.3 ] cli uses real data from homepage

  [ 1.4 ] scraper.homepage - scrapes the homepage and returns a homepage hash

  [ 1.5 ] homepage uses real data from scraper.homepage

[ 2 ] Level 2: After choosing a category it will list the title and author for each experiment (Scraper, ExperimentList and CLI classes)

[ 3 ] Level 3: choosing an experiment will display more data about that experiment (Scraper, Experiment and CLI classes)
