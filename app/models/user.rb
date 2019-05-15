class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :creditcard, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :like_high, dependent: :destroy
  has_many :like_middle, dependent: :destroy
  has_many :like_low, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_many :sns_credentials
  

  # validates :nickname, presence: true, on: :create
  # validates :email, confirmation: true, presence: true, on: :create
  # validates :email_confirmation, presence: true, on: :create
  # validates :email, presence: true, on: :create
  # validates :password, presence: true, on: :create
  # validates :password_confirmation, presence: true, on: :create
  # validates :last_name, presence: true, on: :create
  # validates :first_name, presence: true, on: :create
  # validates :last_name_kana, presence: true, on: :create
  # validates :first_name_kana, presence: true, on: :create
  # validates :first_name_kana, presence: true, on: :create
  # validates :birth_year, presence: true, on: :create
  # validates :birth_month, presence: true, on: :create
  # validates :birth_day, presence: true, on: :create
  # validates :birth_month, presence: true, on: :create



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.create_oauth(oauth)
    user = User.new(
      nickname: oauth.info.name,
      email: oauth.info.email,
      password: Devise.friendly_token
    )
    # oauth認証時はバリデーションを外す
    user.save(:validate => false)
    SnsCredential.create(
      uid: oauth.uid,
      provider: oauth.provider,
      user_id: user.id
    )
    return user
  end
end
