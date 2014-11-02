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

  def feedback
    order = Order.find(order_params[:id])
    if order
      orderser.score = order_params[:score]
      if order.save
        render json: order, status: 200
      else
        render json: { errors: order.errors }, status: 422
      end
    else
      render json: { errors: order.errors}, status: 404
    end
  end

  def index
    render json: Order.all
  end

  def search
    render json: Order.where(order_params)
  end

  def order_params
    params.require(:order).permit(
      :id, :coffeebean, :coffeeintensity, :sweetenertype, :sweetenerintensity, :creamtype, :creamamount, :score
    )
  end
end
