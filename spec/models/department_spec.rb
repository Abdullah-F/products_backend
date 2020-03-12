require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "[ department_columns ]" do
    let(:columns) { Department.column_names }

    it "it hase a name column" do
      expect(columns.include?(:name.to_s)).to be true
    end

    it "it has a created at colun" do
      expect(columns.include?(:created_at.to_s)).to be true
    end

    it "it has an updated at column" do
      expect(columns.include?(:updated_at.to_s)).to be true
    end
  end

  describe "[ associations ]" do
    let(:department) { Department.new }

    it "it has  has_many: products" do
      expect(department.respond_to?(:products)).to be true
    end
  end

  describe "[ validations ]" do
    context "when department values are valid" do
      let(:valid_department) { build(:department) }
      it "it becomes valid" do
        expect(valid_department).to be_valid
      end
    end

    context "[ when department is not valid ]" do
      let(:invalid_department) { build_stubbed(:department) }
      it "it is not valid without a code" do
        invalid_department.name = nil
        expect(invalid_department).to_not be_valid
      end
   end
  end
end
