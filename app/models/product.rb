class Product < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :promotions, -> { where(promotions: { active: true }) }

  validates_presence_of :name, :price

  scope :search, ->(query, search_by) {
          case search_by
          when "name"
            where("products.name LIKE :query", query: "%#{query}%")
          end
        }

  scope :by_department, ->(department_name) {
          joins(:department).where("departments.name LIKE :name", name: "%#{department_name}%")
        }

  scope :by_promotion, ->(promotion_code) {
          joins(:promotions).where("promotions.code LIKE :code",
                                   code: "%#{promotion_code}%")
        }

  def with_active_promotions_applied
   new_price =  promotions.active.pluck(:discount).reduce(price) do |price, discount_percentage|
      price - (price * discount_percentage)
    end
   new_price >= 0 ? new_price : 0
  end
end
