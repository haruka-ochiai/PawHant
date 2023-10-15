# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ログイン後の遷移', type: :system do
  it 'Topページに遷移することを確認' do
    customer = create(:customer, email: 'test@example.com', password: 'password')
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
  visit root_path
  click_button 'マイページ'
  expect(page).to have_content('詳細ページ') 
  end
end