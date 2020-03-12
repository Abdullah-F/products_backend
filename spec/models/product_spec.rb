require 'rails_helper'

RSpec.describe Product, type: :model do
   describe "[ product_columns ]" do
    let(:columns) { Product.column_names }

    it "it has a name column" do
      expect(columns.include?(:name.to_s)).to be true
    end

    it "it has a price column" do
      expect(columns.include?(:price.to_s)).to be true
    end

    it " it has an id column" do
      expect(columns.include?(:id.to_s)).to be true
    end

    it " it has a department_id column" do
      expect(columns.include?(:department_id.to_s)).to be true
    end

    it "it has a created at colun" do
      expect(columns.include?(:created_at.to_s)).to be true
    end

    it "it has an updated at column" do
      expect(columns.include?(:updated_at.to_s)).to be true
    end
  end

  describe "[ associations ]" do
    let(:product) { Product.new }

    it "it has  has_many: products" do
      expect(product.respond_to?(:promotions)).to be true
    end

    it "it has_one department" do
      expect(product.respond_to?(:department)).to be true
    end
  end

  describe "[ validations ]" do
    context "when product values are valid" do
      let(:valid_product) { build(:product) }
      it "it becomes valid" do
        expect(valid_product).to be_valid
      end
    end

    context "[ when product is not valid ]" do
      let(:invalid_product) { build_stubbed(:product) }
      it "it is not valid without a name" do
        invalid_product.name = nil
        expect(invalid_product).to_not be_valid
      end

      it "it is not valid without a department_id" do
        invalid_product.department_id = nil
        expect(invalid_product).to_not be_valid
      end

      it "it is not valid without price" do
        invalid_product.price = nil
        expect(invalid_product).to_not be_valid
      end
    end
  end
end
