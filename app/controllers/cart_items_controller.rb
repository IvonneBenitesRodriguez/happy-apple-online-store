class CartItemsController < ApplicationController
  def create
    @cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:product_id])

    item = @cart.cart_items.find_or_initialize_by(product: product)
    item.quantity = (item.quantity || 0) + 1
    item.save

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to products_path }
    end
  end

  def destroy
  @cart = current_user.cart
  @item = @cart.cart_items.find(params[:id])
  @item.destroy

  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to cart_path }
  end
end
end