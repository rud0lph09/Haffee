class OrderController < ApplicationController
  def index
  end

  def create
    order = Order.new(order_params)
    if order.save
      render: 'EXITO!', status: 200
    else
      render: ":'(", status: 400
    end
  end

  def order_params
    params.require(:order).permit(:coffeeintensity, :sweetenerintensit, :creamamount)
  end
end
