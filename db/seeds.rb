20.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: ['Priya', 'Tanya', 'Priyanka','Divya', 'Tanvi','Ishita','vani', 'Anjali','Shreya', 'Riya', 'Rahul', 'Abhishek','Aditya', 'Amit', 'Mahesh', 'Rohit', 'Yash','Ankit', 'Shyam', 'Deepak'].sample,
    last_name: ['Kumar', 'Lal', 'Sharma', 'Shan','Jai', 'Pal', 'Chande', 'Chander','Nara', 'Rai', 'Nath', 'Goel', 'Bhat', 'Raji', 'Anand', 'Suri', 'Kapoor','Chandra'].sample,
    password: "123456",
    password_confirmation: "123456",
  )

  url = ["https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"].sample
  user.remote_photo_url = url
  user.save


  location = Location.new(
    # name: Faker::FunnyName.three_word_name,
    name: ["Taj Mahal", "Mysore Palace", "Harmandir Sahib",
      "Brihadishwara Temple", "Bahai Temple", "Hawa Mahal",
      "Chhatrapati Shivaji Terminus", "Victoria Memorial",
      "Qutub Minar","Sanchi Stupa", "Gateway of India",
      "Humayun’s Tomb", "Charminar", "Fatehpur Sikri",
      "Ajanta Ellora Caves", "Mahabalipuram Monuments",
      "Khajuraho Monuments","Jaisalmer Fort"].sample,
    address: ["Mumbai", "Delhi", "Bangalore", "Hyderabad",
      "Ahmedabad", "Chennai", "Kolkata",
      "Surat","Pune", "Jaipur", "Lucknow", "Kanpur",
      "Nagpur", "Indore", "Thane", "Bhopal",
      "Visakhapatnam", "Pimpri & Chinchwad", "Patna",
      "Vadodara", "Ghaziabad", "Ludhiana", "Agra", "Nashik",
      "Faridabad", "Meerut", "Rajkot"].sample,
    price: rand(500..3000),
    description: Faker::Lorem.paragraph_by_chars(256, false),
    user_id: user.id,
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude,
    )

    location.remote_cover_url =
      [
        "https://images.unsplash.com/photo-1447678523326-1360892abab8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
        "https://images.unsplash.com/photo-1482282414730-7da4d567f2f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2703&q=80",
        "https://images.unsplash.com/photo-1431576901776-e539bd916ba2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80",
        "https://images.pexels.com/photos/262367/pexels-photo-262367.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/911758/pexels-photo-911758.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/534174/pexels-photo-534174.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/135018/pexels-photo-135018.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/1769356/pexels-photo-1769356.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/262347/pexels-photo-262347.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "https://images.pexels.com/photos/1309897/pexels-photo-1309897.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
      ].sample

    location.save



  9.times do
    photo = Photo.create(
      picture: ["https://images.unsplash.com/photo-1447678523326-1360892abab8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", "https://images.unsplash.com/photo-1482282414730-7da4d567f2f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2703&q=80", "https://images.unsplash.com/photo-1431576901776-e539bd916ba2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80","https://images.pexels.com/photos/262367/pexels-photo-262367.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/911758/pexels-photo-911758.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/534174/pexels-photo-534174.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/135018/pexels-photo-135018.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/1769356/pexels-photo-1769356.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500","https://images.pexels.com/photos/262347/pexels-photo-262347.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", "https://images.pexels.com/photos/1309897/pexels-photo-1309897.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"].sample,
      location: location,
    )

  end
end



