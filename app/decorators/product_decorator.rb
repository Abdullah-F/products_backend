class ProductDecorator < ApplicationDecorator
  delegate_all


  def to_json
    {
      id: object.id,
      name: object.name,
      price: object.price,
      department: object.department,
      promotions: object.promotions,
      updated_at: object.updated_at,
      created_at: object.created_at,
    }
  end
end
