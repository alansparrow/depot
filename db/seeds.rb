# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

Product.create!(title: 'Programming Ruby 1.9 & 2.0',
                description:
                %{<p>
Ruby is the fastest growing and most exciting dynamic language out there.
If you need to get working programs delivered fast, you should add Ruby to
your toolbox.
</p>}, image_url: 'http://pragdave.blogs.pragprog.com/photos/uncategorized/2007/12/13/ruby3_cover_small.jpg', price: 49.95)
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
