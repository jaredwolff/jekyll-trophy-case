Trophy Case
===========
**by jaredwolff**

Trophy Case can be used in conjunction with Jekyll_GA to generate the order of a specialized post preview 
according to popularity and/or a "featured" tag.

# Installation

0. (Not required but encouraged) I used [jekyll\_ga](https://github.com/developmentseed/jekyll-ga) to reorder my posts by most popular. I find this funtionality complements the ability to also feature a post.

1. Add this repo as a submodule to your Jekyll Git project:

        git submodule add git@github.com:jaredwolff/trophy_case.git _plugins/trophy_case/

    Note: You can also copy **trophy\_case.rb** to _plugins/

2. Add the following fields to your _config.yml:

        trophy_case:
            num_items: 3

3. Add trophy\_case.html to your include folder.

# Usage

Here is an example of code inside my Jekyll project. Trophy case adds the **trophy\_order** to the available data for each post. **trophy\_order** indicates the order in which the post should show in the trophy case.

    <div class="trophy-case pull-right">
      <ul class="unstyled inline">
        {% for post in site.posts %}
        {% if post.trophy_order == 1 %}
        {% include trophy_case.html %}
        {% break %}
        {% endif %}
        {% endfor %}

        {% for post in site.posts %}
        {% if post.trophy_order == 2 %}
        {% include trophy_case.html %}
        {% break %}
        {% endif %}
        {% endfor %}

        {% for post in site.posts %}
        {% if post.trophy_order == 3 %}
        {% include trophy_case.html %}
        {% break %}
        {% endif %}
        {% endfor %}
      </ul>
    </div>

#Notes

This was the best way I could think of making this plugin. Have an idea to make it better? Feel free to share! (Pull requests are encouraged.)

#License

See included license file.

