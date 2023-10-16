# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ログイン後の遷移', type: :system do
  it 'Topページに遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit root_path
    expect(page).to have_content('迷子情報一覧(新着順)')
  end

   it '保護情報一覧ページに遷移することを確認' do
    visit root_path
    click_link '保護情報一覧'
    expect(page).to have_content('保護情報一覧')
  end

  it 'マイページに遷移することを確認' do
  customer = create(:customer, email: 'taro@example.com', password: 'password')
  sign_in customer
  visit customer_path(customer)
  expect(page).to have_content '詳細'
  expect(page).to have_link('編集する')
  end

  it 'ゲストユーザーの場合編集ボタンが表示されない' do
  guest_user = create(:guest_user, email: 'guest@example.com', password: 'SecureRandom.urlsafe_base64')
  sign_in guest_user
  visit customer_path(guest_user)
  expect(page).to have_content '詳細'
  expect(page).not_to have_link('編集する')
  end
end

  RSpec.describe "編集画面", type: :system do
  it '会員編集画面の表示' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit edit_customer_path(customer)
    expect(page).to have_content('編集')
    expect(page).not_to have_link('編集内容を保存')
  end




end