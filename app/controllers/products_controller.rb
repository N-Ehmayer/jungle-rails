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
    @overall_rating = overall_rating
  end

  def overall_rating
    total = 0
    amount = @product.ratings.length
    @product.ratings.each do |r|
      total += r.rating.to_i
    end
    return total / amount
  end

end
