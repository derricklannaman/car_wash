puts "Remove all the things"
Vehicle.destroy_all
counter = 1
10.times do
  car_or_truck = ["truck", "car"].sample
  random_plate = rand 1000000..9999999

  vehicle = Vehicle.create(vehicle_type: car_or_truck, plate_number: random_plate,
                           visit_count: 1)
  Transaction.create(vehicle_id: vehicle.id,
                     total_price: car_or_truck == "car" ? 5.00 : 10.00,
                     plate_number: vehicle.plate_number)
  print "." * counter
end
puts
puts "Boom! Finished."
