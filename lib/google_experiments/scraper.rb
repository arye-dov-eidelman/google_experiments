module GoogleExperiments
  class Scraper
    def initialize
          
    end

    def homepage
      categories = [
        {link: "/voice", title: "Voice", subtitle: "Explore voice interaction in fun new ways."},
        {link: "/arts-culture", title: "Arts & Culture", subtitle: "See what happens at the crossroads of art and technology."},
        {link: "/ar", title: "AR", subtitle: "Explorations in augmented reality."},
        {link: "/webvr", title: "WebVR", subtitle: "See what’s possible with virtual reality on the web."},
        {link: "/ai", title: "AI", subtitle: "See what happens when anyone can play with machine learning."},
        {link: "/android", title: "Android", subtitle: "See how creativity and code come together on Android."},
        {link: "/chrome", title: "Chrome", subtitle: "See how creativity and code come together on the web."}
      ]

      about = <<~EOS
        Since 2009, coders have created thousands of amazing experiments using Chrome, Android, AI, WebVR, AR and more.
        We're showcasing projects here, along with helpful tools and resources, to inspire others to create new experiments.
        Here are collections of experiments to explore, with new ones added every week. Have fun.
      EOS
      
      {categories: categories, about: about}
    end
  end
end
