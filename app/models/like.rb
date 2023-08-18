class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :users_id
  belongs_to :post, class_name: 'Post'

  def update_likes_count
    post.update(likes_counter: post.likes.count)
  end
end
