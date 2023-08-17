if Rails.env.development?
  unless User.exists?(email: 'admin@example.com')
    User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin', confirmed_at: Time.now)
  end
end