#Create Sex Pet Values
Sex.create_with(name: 'Masculino').find_or_create_by(code: 'male')
Sex.create_with(name: 'Femenino').find_or_create_by(code: 'female')

#Create Pet Types Values
PetType.create_with(name: 'Rat').find_or_create_by(code: 'rat')
PetType.create_with(name: 'Dog').find_or_create_by(code: 'dog')
PetType.create_with(name: 'Chinchilla').find_or_create_by(code: 'chinchilla')

#Create Admin
Admin.create_with(password: 'password', password_confirmation: 'password').find_or_create_by(email: 'admin@example.com')