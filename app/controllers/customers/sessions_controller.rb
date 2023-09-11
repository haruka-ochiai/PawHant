class Customers::SessionsController < Devise::SessionsController

  # ゲストログイン
  def guest_sign_in
    customer = Customer.guest
    customer.save(validate: false)
    sign_in customer
    redirect_to root_path, notice: "ゲストユーザーでログインしました。"
  end
end