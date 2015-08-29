#Create Sex Pet Values
Sex.find_or_create_by(code: 'male', name: 'Masculino')
Sex.find_or_create_by(code: 'female', name: 'Femenino')

#Create Pet Types Values
PetType.find_or_create_by(code: 'rat', name: 'Rat')
PetType.find_or_create_by(code: 'dog', name: 'Dog')
PetType.find_or_create_by(code: 'chinchilla', name: 'Chinchilla')