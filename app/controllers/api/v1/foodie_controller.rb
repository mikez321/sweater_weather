class Api::V1::FoodieController < ApplicationController
  def show
    result = FoodSearch.result(food_params)
    # render json: FoodieSerializer.new(result).serializable_hash
    render json: result
  end

  private

  def food_params
    params.permit(:start, :end, :search)
  end
end
