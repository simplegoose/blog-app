class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :users_id
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_count

  private

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
