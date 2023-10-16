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

     it "郵便番号のバリデーション" do
    customer = FactoryBot.build(:customer, postcode: nil)
    expect(customer).not_to be_valid
    expect(customer.errors[:postcode]).to include("を入力してください")
    end

    it "Emailのバリデーション" do
    should validate_presence_of(:email)
    should allow_value("valid@email.com").for(:email)
    should_not allow_value("invalid-email").for(:email)
    end

    it "住所のバリデーション" do
    customer = FactoryBot.build(:customer, address: nil)
    expect(customer).not_to be_valid
    expect(customer.errors[:address]).to include("を入力してください")
    end

     it "電話番号のバリデーション" do
    customer = FactoryBot.build(:customer, phone_number: nil)
    expect(customer).not_to be_valid
    expect(customer.errors[:phone_number]).to include("を入力してください")
    end

    it "電話番号のバリデーション" do
    customer = FactoryBot.build(:customer,  phone_number: "090-0000-0000")
    expect(customer).not_to be_valid
    expect(customer.errors[:phone_number]).to include("はハイフンなしの10桁または11桁の数字で入力してください")
    end
    
    it "パスワードが6文字以上であること" do
    customer = Customer.new(email: "test@example.com", password: "short")
    expect(customer).not_to be_valid
    expect(customer.errors[:password]).to include("は6文字以上で入力してください")
  end
  end
end
