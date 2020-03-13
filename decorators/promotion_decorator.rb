class PromotionDecorator < ApplicationDecorator
  delegate_all

  def to_json
    {
      id: object.id,
      code: object.code,
      active: object.active,
      discount: object.discount,
      created_at: object.created_at,
      updated_at: object.updated_at
    }
  end
end
