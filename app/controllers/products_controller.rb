class ProductsController < ApplicationController

    #This is for Shoppe

  def index
    if params[:amount]
      @products = Shoppe::Product.root.where("price < #{params[:amount].to_s.tr('$', '').to_f}")
      # .ordered.includes(:product_categories, :variants)
      #@products = @products.group_by(&:product_category)
    else
      # @products = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
      @products = Shoppe::Product.root
      # .where("price > 60")
      # abort @products.inspect
      # @products = @products.group_by(&:product_category)
    end
  end

  def show
    @product = Shoppe::Product.root.find_by_permalink(params[:permalink])
  end

  def buy
  	@product = Shoppe::Product.root.find_by_permalink!(params[:permalink])
    #abort @product.inspect
  	current_order.order_items.add_item(@product, 1)
  	redirect_to product_path(@product.permalink), :notice => "Product has been added successfuly!"
  end

end
