class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :users_id
  belongs_to :post, class_name: 'Post'

  def update_comments_count
    post.update(comment__counter: post.comments.count)
  end
end
