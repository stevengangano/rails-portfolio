# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |topic|
  Topic.create!(
    title: "topic #{topic}"
  )
end


10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
end

9.times do |portfolio_item|
  Portfolioo.create!(
    title: "Portfolio title: #{portfolio_item}" ,
    subtitle: "Software",
    body: "Lorem ipsum",
    main_image: "http://placehold.it/350x250",
    thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio_item|
  Portfolioo.create!(
    title: "Portfolio title: #{portfolio_item}" ,
    subtitle: "ROR",
    body: "Lorem ipsum",
    main_image: "http://placehold.it/350x250",
    thumb_image: "http://placehold.it/350x200"
  )
end
