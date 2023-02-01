FactoryBot.define do
  factory :payment  do
      post_code { '111-1111' }
      prefecture_id { 2 }
      city { '市町村' }
      block { '番地' }
      building{ '建物名' }
      phone_number { '09012345678' }
      token { 'tok_sample' }
    end
  end

