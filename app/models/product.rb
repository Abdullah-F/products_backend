class Product < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :promotions

  validates_presence_of :name, :price


  scope :search, ->(query, search_by) {
    case search_by
    when 'name'
      where('products.name LIKE :query', query: "%#{query}%")
    end
  }

  scope :by_department, ->(department_name){
    joins(:department).where('departments.name LIKE :name', name: "%#{department_name}%")
  }

  scope :by_promotion, ->(promotion_code){
    joins(:promotions).where('promotions.code LIKE :code',
                            code: "%#{promotion_code}%")
  }

end
