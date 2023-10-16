# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PetPost, type: :model do
  before do
    @pet_post = FactoryBot.build(:pet_post)
  end
  context "バリデーション" do
    it "有効な属性であること" do
      pet_post = FactoryBot.build(:pet_post)
      expect(pet_post).to be_valid
    end

    it "詳細住所のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, area: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:area]).to include("を入力してください")
    end

    it "詳細住所の最小文字数バリデーション" do
      pet_post = FactoryBot.build(:pet_post, area: "A")
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:area]).to include("は2文字以上で入力してください")
    end

    it "年齢のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, age: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:age]).to include("を入力してください")
    end

    it "都道府県のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, prefecture: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:prefecture]).to include("を入力してください")
    end

    it "日付のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, occurred_on: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:occurred_on]).to include("を入力してください")
    end

    it "体重のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, weight: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:weight]).to include("を入力してください")
    end

    it "特徴のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, characteristics: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:characteristics]).to include("を入力してください")
    end

    it "特徴のバリデーション - 最大文字数のテスト" do
      max_length = 50
      characteristics = "A" * (max_length + 1) # 最大文字数を超える文字列を作成

      pet_post = FactoryBot.build(:pet_post, characteristics: characteristics)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:characteristics]).to include("は#{max_length}文字以内で入力してください")
    end

    it "説明文のバリデーション" do
      pet_post = FactoryBot.build(:pet_post, description: nil)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:description]).to include("を入力してください")
    end

    it "説明文のバリデーション - 最大文字数のテスト" do
      max_length = 60
      description = "A" * (max_length + 1) # 最大文字数を超える文字列を作成

      pet_post = FactoryBot.build(:pet_post, description: description)
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:description]).to include("は#{max_length}文字以内で入力してください")
    end

     it "説明文の最小文字数バリデーション" do
      pet_post = FactoryBot.build(:pet_post, description: "A")
      expect(pet_post).not_to be_valid
      expect(pet_post.errors[:description]).to include("は2文字以上で入力してください")
    end
  end
end