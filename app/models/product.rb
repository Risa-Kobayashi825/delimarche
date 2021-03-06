class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable
  has_one_attached :image

 extend DisplayList
 scope :on_category, -> (category) { where(category_id: category) }
 scope :sort_order, -> (order) { order(order) }

 scope :category_products, -> (category, page) { 
    on_category(category).
    display_list(page)
  }

 scope :sort_products, -> (sort_order, page) {
    on_category(sort_order[:sort_category]).
    sort_order(sort_order[:sort]).
    display_list(page)
  }
 
 scope :sort_list, -> { 
    {
      "並び替え" => "", 
      "価格の安い順" => "price asc",
      "価格の高い順" => "price desc", 
    }
  }
  
  scope :in_cart_product_names, -> (cart_item_ids) { where(id: cart_item_ids).pluck(:name).reverse }
  scope :recently_products, -> (number) { order(created_at: "desc").take(number) }
  scope :recommend_products, -> (number) { where(recommended_flag: true).take(number) }
  scope :check_products_carriage_list, -> (product_ids) { where(id: product_ids).pluck(:carriage_flag)}

  
  def reviews_new
    reviews.new
  end
  def reviews_with_id
    reviews.reviews_with_id
  end
end
