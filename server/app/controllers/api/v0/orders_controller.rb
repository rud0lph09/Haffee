class Api::V0::OrdersController < ApplicationController
  respond_to :json

  def create
    order = Order.new(order_params)
    if order.save
      render json: order, status: 201
    else
      render json: { errors: order.errors }, status: 422
    end
  end

  def order_params
    params.require(:order).permit(
      :coffeebean, :coffeeintensity, :sweetenertype, :sweetenerintensirty, :creamtype, :creamintensity
    )
  end
end
