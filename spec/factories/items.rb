FactoryBot.define do
  factory :item do
    name                  {"シャツ"}
    detail                {"男性用シャツ"}
    price                 {10000}
    state                 {0}
    brand                 {"ノーブランド"}
    condition_id          {1}
    shipping_cost_id      {1}
    shipping_date_id      {1} 
    shipping_method_id    {1}
    prefecture_id         {1}
    buyer                 {2}
    category
    user

    after(:build) do |item|
      item.item_images << build(:item_image, item_id: item)
    end

  end
end