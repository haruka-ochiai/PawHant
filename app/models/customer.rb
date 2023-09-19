class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pet_posts, dependent: :destroy
  has_many :customer_pets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sightings, dependent: :destroy
  has_many :sighting_pet_posts, through: :sightings, source: :pet_post
  has_many :group_members, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  #バリデーション
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }, uniqueness: { case_sensitive: false, message: "は既に使用されています" },
  format: { with: /\A[a-zA-Z_\-\p{L}]+\z/u, message: "では数字を使用できません" }
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/, message: "はハイフンなしの7桁の数字で入力してください" }, unless: -> { is_guest }
  validates :address, presence: true, unless: -> { is_guest }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしの10桁または11桁の数字で入力してください" }, unless: -> { is_guest }
  validates :email, presence: true, uniqueness: true


  # ゲストログイン
  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
      customer.postcode = ""
      customer.phone_number = ""
      customer.address = ""
      customer.is_guest = true
      # ゲストユーザーであることを示すフラグ
    end
  end

end
