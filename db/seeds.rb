puts "🌱 Seeding spices..."


  5.times do
    Landlord.create(
      name: Faker::Name.name(),
      phone_number: Faker::Number.number(digits: 8),
      email: Faker::Internet.email(),
      img_url: Faker::Avatar.image
    )
  end

  puts "🌱 1st seed done"


Landlord.all.each do |landlord|
  5.times do
    Property.create(
      location: Faker::Address.city,
      property_type: "#{Faker::Number.between(from: 2, to: 4)} Bedrooms",
      property_name: Faker::Name.name(),
      property_size: "#{Faker::Number.between(from: 600, to: 2000)} sq ft",
      landlord_id: landlord.id
        
    )
  end
end
puts "🌱 2nd seed done"

Property.all.each do |property|
  5.times do
    Tenant.create(
      name: Faker::Name.name(),
      email: Faker::Internet.email(),
      phone_number: Faker::Number.number(digits: 8),
      rent: Faker::Number.between(from: 10000, to: 60000),
      property_id: property.id

    )
  end
end





puts "✅ Done seeding!"
