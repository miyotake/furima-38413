class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # バリデーションは「with_options」を使用することで、共通したオプションを付けることが可能

    validates :nickname, uniqueness: true
    # @が含む、存在することはdeviseのデフォルトで設定されているので省略可能
    validates :email, uniqueness: true
    # 全角ひらがな、全角カタカナ、漢字
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # 全角カタカナ
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday

    # 存在すること・確認用を含めて2回入力・6字以上はdeviseのデフォルト実装のため省略
    # 半角英数字（空文字NG）以外の場合には、メッセージを出す
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  end
end