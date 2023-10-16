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
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit root_path
    click_link '保護情報一覧'
    expect(page).to have_content('保護情報一覧')
  end

  it '通知一覧ページに遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit '/notifications'
    expect(page).to have_content('通知')
  end

  it 'グループ一覧ページに遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit root_path
    click_link 'グループ一覧'
    expect(page).to have_content('グループ一覧')
  end

  it 'マイページに遷移することを確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit customer_path(customer)
    expect(page).to have_content '詳細'
    expect(page).to have_link('編集する')
    expect(page).to have_link('リアクションした投稿')
    expect(page).to have_link('投稿')
  end

  it '他のユーザーのプロフィール情報を閲覧できないことを確認' do
  user_a = create(:customer, email: 'user_a@example.com', password: 'password_a')
  user_b = create(:customer, email: 'user_b@example.com',name: 'ユーザーB', password: 'password_b')
  # ユーザーAでログイン
  sign_in user_a
  visit customer_path(user_b)
  expect(page).not_to have_content(user_b.address)
  expect(page).not_to have_content(user_b.phone_number)
  expect(page).not_to have_content(user_b.postcode)
  expect(page).not_to have_content(user_b.email)
  click_link 'ログアウト'

  # ユーザーBでログイン
  sign_in user_b
  visit customer_path(user_a)
  expect(page).to have_button('チャット')
  expect(page).not_to have_content(user_a.address)
  expect(page).not_to have_content(user_a.phone_number)
  expect(page).not_to have_content(user_a.postcode)
  expect(page).not_to have_content(user_a.email)
end


  it 'ゲストユーザーの場合、編集ボタンが表示されない' do
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

  it '編集内容のバリデーションチェック' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit edit_customer_path(customer)
    fill_in 'customer[name]', with: ''
    fill_in 'customer[email]', with: ''
    click_button '編集内容を保存'
    expect(page).to have_selector('h3.text-danger', text: "3 件のエラーが発生しています。")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "ユーザー名を入力してください")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "ユーザー名は1文字以上で入力してください")
    expect(page).to have_selector('ul.list-unstyled.alert.alert-danger', text: "メールアドレスを入力してください")
  end

  it '有効な編集内容を保存できるか確認' do
    customer = create(:customer, email: 'taro@example.com', password: 'password')
    sign_in customer
    visit edit_customer_path(customer)

    # 有効なデータを入力
    fill_in 'customer[name]', with: 'テスト'
    fill_in 'customer[email]', with: 'tarou@example.com'
    click_button '編集内容を保存'
    expect(page).to have_content('登録情報を変更しました')
    expect(page).to have_content('テスト')
    expect(page).to have_content('tarou@example.com')
  end
end