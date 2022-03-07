FactoryBot.define do
  factory :order_address do
    postal_code { '100-2100' }
    prefecture_id { 16 }
    city { '札幌市' }
    address { '1-1' }
    building { 'メゾンすすきの' }
    phone { '01012345678' }
    token { 'tok_qaswdefrgthyjukiolp' }
  end
end
