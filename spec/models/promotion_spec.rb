require "rails_helper"

RSpec.describe Promotion, type: :model do
  describe "[ promotions_columns ]" do
    let(:columns) { Promotion.column_names }

    it " it has a code column that must be uniqe" do
      expect(columns.include?(:id.to_s)).to be true
    end

    it "it has an active column that is of type boolean" do
      expect(columns.include?(:active.to_s)).to be true
    end

    it " it has an id column" do
      expect(columns.include?(:id.to_s)).to be true
    end

    it " it has a discount column" do
      expect(columns.include?(:discount.to_s)).to be true
    end

    it "it has a created at colun" do
      expect(columns.include?(:created_at.to_s)).to be true
    end

    it "it has an updated at column" do
      expect(columns.include?(:updated_at.to_s)).to be true
    end
  end

  describe "[ associations ]" do
    let(:promotion) { Promotion.new }

    it "it has  has_many: products" do
      expect(promotion.respond_to?(:products)).to be true
    end
  end

  describe "[ columns with default values ]" do
    let(:promotion_defaults) { Promotion.column_defaults }

    context "[ discount ]" do
      it "it has a default value of 0.0" do
        expect(promotion_defaults[:discount.to_s]).to be 0.0
      end
    end

    context "[ active ]" do
      it "it has a default value of false" do
        expect(promotion_defaults[:active.to_s]).to be false
      end
    end
  end

  describe "[ validations ]" do
    context "when promotion values are valid" do
      let(:valid_promotion) { build(:promotion) }
      it "it becomes valid" do
        expect(valid_promotion).to be_valid
      end
    end

    context "[ when promotion is not valid ]" do
      let(:invalid_promotion) { build_stubbed(:promotion) }
      it "it is not valid without a code" do
        invalid_promotion.code = nil
        expect(invalid_promotion).to_not be_valid
      end

      it "it has a unique code" do
        promotion = create(:promotion)
        promotion_dup = promotion.dup
        promotion_dup.save
        expect {
          promotion_dup.update!(code: promotion.code)
        }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
