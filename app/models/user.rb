class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :form_inquiries, dependent: :destroy
  has_one :chat_room, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :followers, through: :passive_relationships, source: :following

  validates :introduction, length: { maximum: 40 }
  with_options presence: true do
    validates :name
    validates :email
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  attachment :profile_image

  def is_deleted_to_sring
    if is_deleted == true
      "退会済"
    elsif is_deleted == false
      "有効"
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト会員"
      user.introduction = "こちらはゲスト・アカウント（会員）です。会員の機能を利用することができます。"
      user.id = 1
    end
  end
end
