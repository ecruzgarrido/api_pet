Battle.blueprint do
  first_fighter_id { Pet.make!.id }
  second_fighter_id { Pet.make!.id }
  start { DateTime.now }
end