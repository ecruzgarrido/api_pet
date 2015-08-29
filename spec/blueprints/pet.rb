Pet.blueprint do
  name  { "Pet #{sn}" }
  birthdate { Date.today }
  user_id { User.make!.id }
  sex_id { Sex.first.try(:id) || Sex.make!.id }
  pet_type_id { PetType.first.try(:id) || PetType.make!.id }
end