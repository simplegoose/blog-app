class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :users_id
  belongs_to :post, class_name: 'Post'
  after_save :update_comments_count

  def update_comments_count
    post.increment!(:comment__counter)
  end
end
