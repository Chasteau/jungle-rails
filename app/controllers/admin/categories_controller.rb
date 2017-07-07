class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end


  # def new
  #   @category = Category.new
  # end

  # def create
  #   @category = Category.new(category_params)

  #   if @category.save
  #     redirect_to[:admin, :categories], notice 'Category created!'
  #   else
  #     render
  # end

  # private

  # def category_params(:category).permit(:name)
  # end

end
