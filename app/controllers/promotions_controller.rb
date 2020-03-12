class PromotionsController < ApplicationController

  def index
    render json: Promotion.all.decorate.to_json
  end
end
