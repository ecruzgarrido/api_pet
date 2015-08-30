User.blueprint do
  name  { "User #{sn}" }
  email { "user_#{sn}@example.com" }
  password { '12345678' }
  password_confirmation { '12345678' }
end