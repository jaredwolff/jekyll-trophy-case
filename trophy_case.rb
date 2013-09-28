module Jekyll
  class TrophyCaseGenerator < Generator
    safe true
    priority :normal

    # Adds the trophy order to the full set of posts
    # The number of trophy items can be set in config
    def generate(site)
      settings = site.config["trophy_case"]
      num_items =  settings["num_items"] ? settings["num_items"] : 3
      count = 1
      featured_titles = []
      trophy_case = []

      # First iterate through to find the featured posts
      for post in site.posts
        if count <= num_items
          if post.data['featured'] and not featured_titles.include? post.title
            featured_titles << post.title

            post.data.merge!("trophy_order" => count)

            count += 1
          end
        else
          return
        end
      end

      # Then iterate through to fill in the empty spaces (if they exist)
      for post in site.posts
        if count <= num_items
          if not featured_titles.include? post.title
            featured_titles << post.title

            post.data.merge!("trophy_order" => count)

            count += 1
          end
        else
          return
        end
      end
    end
  end
end