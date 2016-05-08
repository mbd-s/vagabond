# City.destroy_all
# cities = City.create([
#   { name: 'San Francisco', image: 'https://upload.wikimedia.org/wikipedia/commons/5/54/Golden_Gate_Bridge_0002.jpg' },
#   { name: 'London', image: 'https://upload.wikimedia.org/wikipedia/commons/6/67/London_Eye_(1302205182).jpg' },
#   { name: 'Gibraltar', image: 'https://www.azamaraclubcruises.com/sites/default/files/heros/gibraltar-united-kingdom.jpg'  },
#   { name: 'Berlin', image: 'https://upload.wikimedia.org/wikipedia/commons/1/17/Berlin-_Brandenburg_gate_(Brandenburg_Tor)_at_night_-_3942.jpg'},
#   { name: 'New York City', image: 'http://www.ssn.tv/wp-content/uploads/2014/07/NYC-1.jpg'},
#   { name: 'Paris', image: 'http://www.technobuffalo.com/wp-content/uploads/2016/02/paris.jpg'},
#   { name: 'Los Angeles', image: 'http://images.inc.com/uploaded_files/image/1940x900/los-angeles11-44-43_40530.jpg'},
#   { name: 'Chicago', image: 'http://cdn.acbl.org/wp-content/uploads/2014/08/Chicago3.jpg'},
#   { name: 'Beijing', image: 'http://suabroad.syr.edu/destinations/beijing/beijingimages/Beijingskyline.jpg'},
#   { name: 'Washington, D.C', image: 'https://i.ytimg.com/vi/QTZQ9bta31w/maxresdefault.jpg'}
#   ])

# User.destroy_all

Post.destroy_all
posts = Post.create([{title: 'This is a post title', content: 'I should be at the top.', city_id: 54, user_id: 10},
   {title: 'Another post title', content: 'I should be in the middle.', city_id: 54, user_id: 10},
   {title: 'Great content alert', content: 'This should be at the bottom.', city_id: 54, user_id: 10}])
