class OrdersController < ApplicationController
  def new
    @cart = current_user.cart
    @cart_items = @cart&.cart_items&.includes(:product) || []
    redirect_to cart_path, alert: "Your cart is empty." if @cart_items.empty?
    @order = Order.new
  end

  def create
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)

    if @cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty." and return
    end

    total = @cart_items.sum { |item| item.quantity * item.product.price }

    @order = current_user.orders.build(order_params.merge(total: total, status: "pending"))

    if @order.save
      @cart_items.each do |item|
        @order.order_items.create!(
          product: item.product,
          quantity: item.quantity,
          price: item.product.price
        )
      end
      @cart_items.destroy_all
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :phone, :payment_method)
  end
end