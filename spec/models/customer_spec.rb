# frozen_string_literal: true

require 'rails_helper'

describe Customer, type: :model do
  context "バリデーション" do
    it "有効な属性であること" do
      customer = FactoryBot.build(:customer)
      expect(customer).to be_valid
    end

    it "名前のバリデーション" do
      customer = FactoryBot.build(:customer, name: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:name]).to include("を入力してください")
    end

    it "名前の長さのバリデーション" do
      customer = FactoryBot.build(:customer, name: "A" * 11)
      expect(customer).not_to be_valid
      expect(customer.errors[:name]).to include("は10文字以内で入力してください")
    end

    it "名前の一意性のバリデーション (大文字小文字を区別しない)" do
      existing_customer = FactoryBot.create(:customer, name: "TestName")
      customer = FactoryBot.build(:customer, name: "testname")
      expect(customer).not_to be_valid
      expect(customer.errors[:name]).to include("は既に使用されています")
    end
    
    it "郵便番号のバリデーション" do
    customer = FactoryBot.build(:customer, postcode: "123-456")
    expect(customer).not_to be_valid
    expect(customer.errors[:postcode]).to include("はハイフンなしの7桁の数字で入力してください")
    end
    
  end
end
