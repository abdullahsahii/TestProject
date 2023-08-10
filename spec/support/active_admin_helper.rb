puts 'Loading active_admin_helper'
RSpec.configure do |config|
  config.before(:suite) do
    ActiveAdmin.unload!
    Rails.application.load_seed
    ActiveAdmin.load!
  end
end