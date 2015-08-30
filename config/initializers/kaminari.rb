#https://github.com/activeadmin/activeadmin/wiki/How-to-work-with-will_paginate
#If you use will_paginate in your app, you need to configure
# an initializerfor Kaminari to avoid conflicts.
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end