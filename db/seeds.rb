# City.destroy_all
# cities = City.create([{ name: 'San Francisco',
#   image: 'http://localemagazine.com/wp-content/uploads/2016/03/landmark-bridge-cliff-california.jpeg' },
#   { name: 'London' }, { name: 'Gibraltar' }])
# p "Created #{City.count} cities."

Post.destroy_all
posts = Post.create([{title: 'This is a post title', content: 'I should be at the bottom.', city_id: 115},
   {title: 'Another post title', content: 'I should be in the middle.', city_id: 115},
   {title: 'Great content alert', content: 'This should be at the top.', city_id: 115}])
p "Created #{Post.count} posts."
