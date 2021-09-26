# このシーダーは、先にmajor_categories_seeder.rbで親カテゴリを作成しておかないと動作しない
major_category_names_and_ids = MajorCategory.major_category_name_and_id

food_categories = ["ラーメン", "肉", "カレー", "イタリアン", "フレンチ", "パン", "スイーツ", "お酒", "その他"]
other_categories = ["その他"]
major_category_names_and_ids.each do |major_category_name,major_category_id|
  if major_category_name == "食べ物"

    food_categories.each do |food_category|
      Category.create(
        name: food_category,
        description: food_category,
        major_category_name: major_category_name,
        major_category_id: major_category_id
      )
    end
  elsif major_category_name == "その他"
    other_categories.each do |other_category|
      Category.create(
        name: other_category,
        description: other_category,
        major_category_name: major_category_name,
        major_category_id: major_category_id
      )
    end
  end
end