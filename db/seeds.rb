major_category_names = ["食べ物","その他"]
food_categories = ["ラーメン", "肉", "カレー", "イタリアン", "フレンチ", "パン", "スイーツ", "お酒", "その他"]
other_categories = ["その他"]
major_category_names.each do |major_category_name|
  if major_category_name == "食べ物"

    food_categories.each do |food_category|
      Category.create(
        name: food_category,
        description: food_category,
        major_category_name: major_category_name
      )
    end
  elsif major_category_name == "その他"
    other_categories.each do |other_category|
      Category.create(
        name: other_category,
        description: other_category,
        major_category_name: major_category_name
      )
    end
  end    
end