FactoryBot.define do
  factory :user do
    nickname               { 'noah' }
    family_name            { '桃屋' }
    first_name             { 'のあ' }
    family_n_k       { 'モモヤ' }
    first_n_k        { 'ノア' }
    email                  { Faker::Internet.free_email }
    password               { '123456a' }
    password_confirmation  { '123456a' }
    text                   { 'おおん' }
  end
end