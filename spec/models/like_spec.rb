require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'class functions' do
    before(:each) do
      @user = User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Footballer from England')
      @user.save
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      @post.save
    end

    it 'like_count should be updated on post' do
      Like.create(author: @user, post: @post)
      expect(@post.likes_counter).to eq(1)
    end
  end
end
