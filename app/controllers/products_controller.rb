class ProductsController < ApplicationController
  def index
    products = Product.all.eager_load(:promotions, :department)
    products = products.search(params[:query], params[:search_column]) if params[:query].present?
    products = products.by_department(params[:department_name]) if params[:department_name].present?
    products = products.by_promotion(params[:promotion_code]) if params[:promotion_code].present?
    products = products.page(params[:page]).per(params[:per_page])
    render json: {
      products: products.decorate.to_json,
      totalNumberOfPages: products.total_pages,
    }
  end
end
