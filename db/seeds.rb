# Create admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

puts "Admin user created with email: admin@example.com and password: password"

# Restaurant categories
categories = ['Fine Dining', 'Casual', 'Fast Food', 'Café', 'Bistro', 'Brasserie', 'Seafood', 'Steakhouse', 'Pizzeria']

# Price levels
price_levels = ['$', '$$', '$$$', '$$$$']

# Restaurant descriptions
descriptions = [
  "A charming restaurant offering authentic regional specialties made with locally sourced ingredients in a warm, inviting atmosphere.",
  "This elegant dining establishment features innovative cuisine that blends traditional flavors with modern techniques, served in a sophisticated setting.",
  "A relaxed eatery where comfort food meets gourmet expertise, perfect for casual meals with friends and family.",
  "With its waterfront location, this restaurant provides stunning views along with fresh seafood caught daily by local fishermen.",
  "A culinary journey showcasing diverse international flavors, presented with artistic flair and attention to detail.",
  "This cozy bistro offers home-style cooking with a contemporary twist, creating a memorable dining experience in an intimate setting."
]

# Sample restaurant data
restaurants_data = [
  {
    name: "Le Bistrot Provençal",
    category: "Bistro",
    price_level: "$$$",
    description: "Authentic Provençal cuisine with a focus on seasonal ingredients from local markets. Our chef creates traditional dishes with modern presentation, capturing the essence of Southern France.",
    address: "123 Boulevard des Lavandes, Camargue",
    phone: "+33 1 23 45 67 89",
    website: "http://bistrotprovencal.example.com"
  },
  {
    name: "Café du Port",
    category: "Café",
    price_level: "$$",
    description: "Cozy waterfront café offering fresh seafood and stunning marina views. Enjoy a casual breakfast, lunch or dinner while watching the boats come and go in this charming harbor setting.",
    address: "45 Quai du Port, Camargue",
    phone: "+33 1 98 76 54 32",
    website: "http://cafeduport.example.com"
  },
  {
    name: "L'Olivier",
    category: "Bistro",
    price_level: "$$",
    description: "Traditional Mediterranean dishes served in a charming setting with olive trees. Our menu celebrates the rich culinary heritage of the region with locally-sourced olives and olive oil.",
    address: "78 Rue des Oliviers, Camargue",
    phone: "+33 1 45 67 89 01",
    website: "http://lolivier.example.com"
  },
  {
    name: "La Table de Sébastien",
    category: "Fine Dining",
    price_level: "$$$$",
    description: "Exquisite French gastronomy with a modern twist by Chef Sébastien. Our Michelin-starred restaurant offers an unforgettable culinary journey with carefully crafted tasting menus.",
    address: "12 Avenue Gourmet, Camargue",
    phone: "+33 1 23 56 78 90",
    website: "http://tabledesebastien.example.com"
  },
  {
    name: "Le Garage",
    category: "Casual",
    price_level: "$",
    description: "Industrial-chic setting serving casual comfort food with local craft beers. Once an actual garage, this trendy spot now offers hearty meals in a relaxed atmosphere.",
    address: "34 Rue Mécanique, Camargue",
    phone: "+33 1 90 87 65 43",
    website: "http://legarage.example.com"
  },
  {
    name: "Flamant Rose",
    category: "Fine Dining",
    price_level: "$$$",
    description: "Elegant restaurant specializing in Camargue rice dishes and local specialties. Named after the iconic pink flamingos of the region, we celebrate local ingredients and traditions.",
    address: "56 Chemin des Flamants, Camargue",
    phone: "+33 1 34 56 78 90",
    website: "http://flamantrose.example.com"
  }
]

# Create restaurants
restaurants_data.each do |restaurant_data|
  restaurant = admin.restaurants.create!(restaurant_data)
  puts "Created restaurant: #{restaurant.name}"

  # Create QR code for each restaurant
  qr_code = admin.qr_codes.create!(
    title: "#{restaurant.name} QR Code",
    url: "http://qrgastro.example.com/restaurants/#{restaurant.id}",
    description: "QR code for #{restaurant.name}",
    active: true,
    visits_count: rand(10..100),
    linkable: restaurant
  )

  puts "  - Created QR code for: #{restaurant.name}"
end

# Create additional standalone QR codes
5.times do |i|
  qr_code = admin.qr_codes.create!(
    title: "Menu QR Code #{i+1}",
    url: "http://qrgastro.example.com/menus/sample-#{i+1}",
    description: "QR code for digital menu #{i+1}",
    active: [true, true, true, false].sample,
    visits_count: rand(5..50)
  )

  puts "Created standalone QR code: #{qr_code.title}"
end

puts "Seed data created successfully!"
