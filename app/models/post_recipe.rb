class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: lambda { |attributes| attributes[:body].blank? }

  with_options presence: true, on: :publicize do
    validates :serving
    validates :title
    validates :introduction
    validates :procedures
    validates :post_recipe_image
  end
  validates :title, length: { maximum: 14 }, on: :publicize
  validates :introduction, length: { maximum: 80 }, on: :publicize

  mount_uploader :post_recipe_image, PostRecipeUploader

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def saved_by?(user)
    saved_recipes.where(user_id: user.id).exists?
  end

  def browsing_history(current_user)
    new_history = histories.new
    new_history.user_id = current_user.id
    if current_user.histories.exists?(post_recipe_id: id)
      visited_history = current_user.histories.find_by(post_recipe_id: id)
      visited_history.destroy
    end
    new_history.save

    histories_stock_limit = 20
    histories = current_user.histories.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end
  end

  def self.create_recipe_ranks
    PostRecipe.find(Like.group(:post_recipe_id).order('count(post_recipe_id) desc').limit(20).pluck(:post_recipe_id))
  end

  def new_form_instance()
    # procedure_filled_in_count = procedures.length
    # if procedure_filled_in_count < 3
    #   add_procedure_form_count = 3 - procedure_filled_in_count
    #   for i in 1..add_procedure_form_count do
    #     procedures.build
    #   end
    # end
  end
end
