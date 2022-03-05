class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORDL_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  VALID_JAPANESE_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー]+\z/
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: VALID_PASSWORDL_REGEX, message: '英字数字両方を使用してください' }
    validates :password_confirmation, format: { with: VALID_PASSWORDL_REGEX, message: '英字数字両方を使用してください' }
    validates :first_name, format: { with: VALID_JAPANESE_REGEX, message: '全角文字を使用してください' }
    validates :last_name, format: { with: VALID_JAPANESE_REGEX, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: '全角カタカナを使用してください' }
    validates :last_name_kana, format: { with: VALID_KANA_REGEX, message: '全角カタカナを使用してください' }
    validates :birth_date
  end

end
