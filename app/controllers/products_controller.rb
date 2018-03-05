class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @rating = Rating.new
    if current_user
      @user_id = current_user.id
    end
  end

end
