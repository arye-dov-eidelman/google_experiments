# notes

[ 1 ] Level 1: On the welcome page the user will be shown a numbered list of all the experiment categories with a short description (Scraper, Homepage, Category, and CLI classes)

  [ 1.1 ] cli (fake data) - design's the UI

  [ 1.2 ] scraper.homepage (fake data) - returns all data about the home page as a hash

  [ 1.3 ] homepage uses the data from scraper.homepage

  [ 1.4 ] cli uses the data from homepage

  [ 1.5 ] scraper.homepage - scrapes the homepage and returns a homepage hash

[ 2 ] Level 2: After choosing a category it will list the title and author for each experiment (Scraper, Category, Experiment, and CLI classes)

[ 3 ] Level 3: choosing an experiment will display more data about that experiment (Scraper, Experiment, and CLI classes)

## notes about change of plan done on 4/9/2018 (mainly to self, dont be surprised if you don't understand.)

``` ruby
                fake = "dosen't use data from its parent (a from b, b from c or c from the actual_live_website)"
                real = not fake
      actual_live_website
        c = scraper.hompage
          b = hompage
            a = cli
# old plan
[ 1.1 ]     a   fake
[ 1.2 ]   b     fake
[ 1.3 ]     a   real
[ 1.4 ] c
[ 1.5 ]   b     real
# new plan
[ 1.1 ]     a   fake
[ 1.2 ] c       fake
[ 1.3 ]   b
[ 1.4 ]     a   real
[ 1.5 ] c       real
```
