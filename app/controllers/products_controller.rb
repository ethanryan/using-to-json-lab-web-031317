class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  # def show
  #   @product = Product.find(params[:id])
  # end

  #changing above to:
  def show
  @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product.to_json(only: [:name, :description, :inventory, :price]) }
    end
  end

  # def data
  #   product = Product.find(params[:id])
  #   render json: ProductSerializer.serialize(product)
  # end

  #changing above to:
  def product_data
    product = Product.find(params[:id])
    #render json: ProductSerializer.serialize(product)
    render json: product.to_json(only: [:name, :description, :inventory, :price])
  end
  # product id, name, description, inventory and price in the JSON response


  #reference from last lesson:

  # def post_data
  #   post = Post.find(params[:id])
  #   #render json: PostSerializer.serialize(post)
  #   render json: post.to_json(only: [:title, :description, :id],
  #                             include: [ author: { only: [:name]}])
  # end
  #
  # def show
  # @post = Post.find(params[:id])
  #   respond_to do |format|
  #     format.html { render :show }
  #     format.json { render json: @post.to_json(only: [:title, :description, :id],
  #                             include: [author: { only: [:name]}]) }
  #   end
  # end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
