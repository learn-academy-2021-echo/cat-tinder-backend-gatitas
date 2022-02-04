# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
cats = [
    {
      name: "Mittens",
      age: 5,
      enjoys: "sunshine and warm spots",
      image: "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },
    {
      name: "Raisins",
      age: 4,
      enjoys: "being queen of the dogs",
      image: "https://images.unsplash.com/photo-1533743983669-94fa5c4338ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80"
    },
    {
      name: "Toast",
      age: 1,
      enjoys: "getting all the attention",
      image: "https://images.unsplash.com/photo-1592194996308-7b43878e84a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },
    {
      name: "Tiger",
      age: 8,
      enjoys: "long walks on the beach",
      image: "https://www.awesomeinventions.com/wp-content/uploads/2019/08/thor-the-bengal-cat.jpg"
    },
    {
      name: "Ricky",
      age: 5,
      enjoys: "purring",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQP4YtfMkSWvMiZE2k9mhbNv2b5DgtB2qDSw&usqp=CAU"
    },
  ]
  cats.each do |each_cat|
    Cat.create each_cat
    puts "creating cat #{each_cat}"
  end
