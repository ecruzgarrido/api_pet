#Create Sex Pet Values
male = Sex.create_with(name: 'Masculino').find_or_create_by(code: 'male')
female = Sex.create_with(name: 'Femenino').find_or_create_by(code: 'female')

#Create Pet Types Values
rat = PetType.create_with(name: 'Rat').find_or_create_by(code: 'rat')
dog = PetType.create_with(name: 'Dog').find_or_create_by(code: 'dog')
chinchilla = PetType.create_with(name: 'Chinchilla').find_or_create_by(code: 'chinchilla')

#Create Users
user_1 = User.create_with(name: 'User 1', password: '12345678', password_confirmation: '12345678').find_or_create_by(email: 'user_1@example.com')
user_2 = User.create_with(name: 'User 2', password: '12345678', password_confirmation: '12345678').find_or_create_by(email: 'user_2@example.com')
user_3 = User.create_with(name: 'User 3', password: '12345678', password_confirmation: '12345678').find_or_create_by(email: 'user_3@example.com')
user_4 = User.create_with(name: 'User 4', password: '12345678', password_confirmation: '12345678').find_or_create_by(email: 'user_4@example.com')

#Create Pets
Pet.create_with(name: 'Pet 1', birthdate: Date.today, user_id: user_1.id, sex_id: male.id, pet_type_id: rat.id).find_or_create_by(user_id: user_1.id, pet_type_id: rat.id)
Pet.create_with(name: 'Pet 2', birthdate: Date.today - 1.year, user_id: user_2.id, sex_id: female.id, pet_type_id: dog.id).find_or_create_by(user_id: user_2.id, pet_type_id: dog.id)
Pet.create_with(name: 'Pet 3', birthdate: Date.today - 1.year, user_id: user_3.id, sex_id: male.id, pet_type_id: chinchilla.id).find_or_create_by(user_id: user_3.id, pet_type_id: chinchilla.id)
Pet.create_with(name: 'Pet 4', birthdate: Date.today - 3.year, user_id: user_4.id, sex_id: female.id, pet_type_id: rat.id).find_or_create_by(user_id: user_4.id, pet_type_id: rat.id)
Pet.create_with(name: 'Pet 5', birthdate: Date.today - 3.year, user_id: user_1.id, sex_id: male.id, pet_type_id: dog.id).find_or_create_by(user_id: user_1.id, pet_type_id: dog.id)
Pet.create_with(name: 'Pet 6', birthdate: Date.today - 4.year, user_id: user_2.id, sex_id: female.id, pet_type_id: chinchilla.id).find_or_create_by(user_id: user_2.id, pet_type_id: chinchilla.id)

#Create Admin
Admin.create_with(password: 'password', password_confirmation: 'password').find_or_create_by(email: 'admin@example.com')