class RatingsController < ApplicationController

  before_filter :require_user

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      puts "Rating saved"
    end

    redirect_to :back
    puts "DIDN'T SAVE"
    puts rating_params
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to :back
  end



  def rating_params
    params.require(:rating).permit(
      :rating,
      :description,
      :product_id,
      :user_id
    )
  end

end
