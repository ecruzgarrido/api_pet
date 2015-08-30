Admin.blueprint do
  email { "admin_#{sn}@example.com" }
  password { '12345678' }
  password_confirmation { '12345678' }
end