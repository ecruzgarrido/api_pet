RSpec.configure do |config|
  config.include RocketPants::TestHelper,    type: :controller
  config.include RocketPants::RSpecMatchers, type: :controller
end