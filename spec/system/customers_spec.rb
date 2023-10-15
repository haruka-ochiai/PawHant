# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ログイン前の遷移', type: :system do
  it 'ログインが必要な投稿詳細画面にアクセスするとログイン画面にリダイレクトされる' do
    # ログインが必要なページにアクセスしようとします
    visit pet_post_path(1)
    # ログイン画面にリダイレクトされることを確認
    expect(page).to have_current_path(new_customer_session_path)
  end
end