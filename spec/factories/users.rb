FactoryBot.define do
  factory :user do
    provider 'github'
    uid '12345'
    name 'Colin Armstrong'
    login 'default_username'
    token ENV['TEST_TOKEN']
    image 'image.jpg'
  end
end 
