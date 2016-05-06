City.destroy_all
cities = City.create([{ name: 'San Francisco', image: 'http://localemagazine.com/wp-content/uploads/2016/03/landmark-bridge-cliff-california.jpeg' }, { name: 'London' }, { name: 'Gibraltar' },
   { name: 'Berlin' }, { name: 'New York City' }, { name: 'Paris' }, { name: 'Moscow' },
   { name: 'Tokyo' }, { name: 'Cairo' }, { name: 'Los Angeles' }, { name: 'Mexico City' },
   { name: 'Mumbai' }, { name: 'Lagos' }, { name: 'Chicago' }, { name: 'Detroit' },
   { name: 'Beijing' }, { name: 'Barcelona' }, { name: 'Copenhagen' }, { name: 'Athens' },
   { name: 'Sao Paulo' }, { name: 'Istanbul' }, { name: 'Washington, D.C.' }, { name: 'Sunnyvale' }])
p "Created #{City.count} records"
