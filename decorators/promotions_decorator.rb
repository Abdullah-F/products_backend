class PromotionsDecorator < ApplicationCollectionDecorator

  def to_json
    object.map{ |promotion| promotion.decorate.to_json }
  end
end
