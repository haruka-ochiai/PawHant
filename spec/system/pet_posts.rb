# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ログイン後の遷移', type: :system do
  before do
    @pet_post = FactoryBot.build(:pet_post)
  end
  it 'Topページに遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit root_path
    expect(page).to have_content('迷子情報一覧(新着順)')
  end
  
  it '登録画面に遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit root_path
    click_link '迷子・保護情報を登録'
    expect(page).to have_content('新規登録')
  end
  
  it '登録時のバリデーションチェック' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit new_pet_post_path
    fill_in 'pet_post[area]', with: ''
    fill_in 'pet_post[description]', with: ''
    click_button '新規登録'
    expect(page).to have_selector('h3.text-danger', text: /9\s*件のエラーが発生しています。/)
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "詳細住所を入力してください")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "詳細住所は2文字以上で入力してください")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "説明文を入力してください")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "説明文は2文字以上で入力してください")
  end
  
  it '正常なデータで投稿できることを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit new_pet_post_path
    
    @pet_post = FactoryBot.build(:pet_post) 
     
    fill_in 'pet_post[age]', with: @pet_post.age
    choose 'lost_radio'
    choose 'cat_radio'
    choose 'male_radio'
    select '東京都', from: 'pet_post[prefecture]'
    fill_in 'pet_post[area]', with: @pet_post.area
    fill_in 'pet_post[occurred_on]', with: @pet_post.occurred_on
    select '1~5kg', from: 'pet_post[weight]'
    fill_in 'pet_post[characteristics]', with: @pet_post.characteristics
    fill_in 'pet_post[description]', with: @pet_post.description
  
    click_button '新規登録'
  
    # フォームの送信後、適切なリダイレクト先にいることを確認
    expect(page).to have_current_path(pet_post_path(PetPost.last))
  
    # データベースにデータが正しく保存されたことを確認
    expect(PetPost.last.area).to eq('渋谷区')
    expect(PetPost.last.description).to eq('これはテストです')
    
    # 内容が表示されているか確認
    expect(page).to have_content('東京都')
    expect(page).to have_content('渋谷区')
    expect(page).to have_content('人懐っこいです')
    expect(page).to have_content('オス')
    expect(page).to have_content('猫')
  end

  it '編集後にデータが反映されることを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
  
    # 編集前のペットポストを作成
    pet_post = create(:pet_post, customer: customer)
    visit edit_pet_post_path(pet_post)
  
    # 編集フォームに新しいデータを入力
    new_age = '3歳'
    new_area = '新しい場所'
    new_description = 'これは編集後のテストです'
  
    fill_in 'pet_post[age]', with: new_age
    fill_in 'pet_post[area]', with: new_area
    fill_in 'pet_post[description]', with: new_description
  
    click_button '更新する'
  
    expect(page).to have_current_path(pet_post_path(pet_post))
  
    # データベースにデータが正しく更新されたことを確認
    pet_post.reload # データベースから最新のデータを取得
    expect(pet_post.age).to eq(new_age)
    expect(pet_post.area).to eq(new_area)
    expect(pet_post.description).to eq(new_description)
  
    expect(page).to have_content(new_age)
    expect(page).to have_content(new_area)
    expect(page).to have_content(new_description)
  end
end