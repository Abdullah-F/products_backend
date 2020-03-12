class ProductsController < ApplicationController
  def index
    products = Product.all
    products = products.search(params[:query], params[:search_column]) if params[:query].present?
    products = products.by_department(params[:department_name]) if params[:department_name].present?
    products = products.by_promotion(params[:promotion_code]) if params[:promotion_code].present?
    render json: products.decorate.to_json
  end
end
