class Dashboard::CategoriesController < ApplicationController
  before_action :authenticate_admin!, except: :index
  before_action :set_category, only: %w[show edit update destroy]
  layout "dashboard/dashboard"

  def index
    @categories = Category.display_list(params[:page])
    @category = Category.new
    @major_categories = MajorCategory.all
  end

  def show
  end

  def create
    category = Category.new(category_params)
    category.save
    
    # 画像の保存(画像ファイル名をcategories テーブルに、画像自体はpublic/images/categoriesに保存)
    if category_params[:image_name]
      category.image_name = "#{category.id}.jpg"
      image = category_params[:image_name]
      File.binwrite("public/images/categories/#{category.image_name}", image.read)
      category.save
    end
    
    redirect_to dashboard_categories_path
  end

  def edit
    @major_categories = MajorCategory.all
  end

  def update
    @category.update(category_params)
    @category.save
    
     
    if category_params[:image_name]
      @category.image_name = "#{@category.id}.jpg"
      image = category_params[:image_name]
      File.binwrite("public/images/categories/#{@category.image_name}", image.read)
      @category.save
    end   
    
    redirect_to dashboard_categories_path
  end

  def destroy
    @category.destroy
    redirect_to dashboard_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name,:description,:image_name,:major_category_name,:major_category_id)
    end
end