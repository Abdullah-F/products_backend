#create user
#
User.create name: "user", email: "user@domain.com", password: "123456"
# create departments
#
10.times.each do |i|
  Department.create name: "department_#{i}"
end

#create promotions
#generate unique codes
codes = []

10.times.each do |i|
  loop do
    code = SecureRandom.hex(20)
    unless codes.include?(code)
      codes << code
      break
    end
  end
end

# simple calculation for promotions
def calculate_dicsount(index)
  ((index + 1) * 9) / 100.0
end

codes.each_with_index do |code, index|
  Promotion.create code: code, active: [false, true].sample,
    discount: calculate_dicsount(index)
end

#create products
promotions_ids = Promotion.pluck(:id)
departments = Department.all

departments.each do |i|
  20.times.each do |j|
    Product.create(
      name: "product_#{i.id}#{j}",
      price: 1000,
      department: i,
      promotions: Promotion.where(id: promotions_ids.sample(4)),
    )
  end
end
