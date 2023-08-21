require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'class functions' do
    before(:each) do
      @user = User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Footballer from England')
      @user.save
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      @post.save
    end

    it 'comment__count should be updated on post' do
      Comment.create(post: @post, author: @user, text: 'Hi Lilly!')
      expect(@post.comment__counter).to eq(1)
    end
  end
end
