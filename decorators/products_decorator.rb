class ProductsDecorator < ApplicationCollectionDecorator

  def to_json
    object.map { |product| product.decorate.to_json }
  end
end
