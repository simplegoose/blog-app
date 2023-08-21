require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Footballer from England')
      @user.save
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      @post.save
    end

    it 'post should have a title' do
      expect(@post.title).not_to be_nil
    end

    it 'post should not have a title greater than 250 characters' do
      @post.title = rand(36**500).to_s(36)
      expect(@post).to_not be_valid
    end

    it 'comment__counter should be an integer' do
      @post.comment__counter = nil
      expect(@post).to_not be_valid
    end

    it 'likes_counter should be an integer' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'comment__counter should be greater than or equal to zero' do
      @post.comment__counter = -1
      expect(@post).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end

  describe 'class functions' do
    before(:each) do
      @first_user = User.new(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Coach from England')
      @second_user = User.new(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Sporting director from England')
      @first_user.save
      @second_user.save
      @post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    end

    it 'returns posts counter on user instance that equals 1' do
      expect(@first_user.post_counter).to eq(1)
    end

    it 'returns five most recent comments made on the post' do
      @first_comment = Comment.create(post: @post, author: @first_user, text: 'Hi Lilly!', created_at: 15.day.ago)
      @first_comment.save
      @second_comment = Comment.create(post: @post, author: @first_user, text: 'Hi Lilly!', created_at: 14.day.ago)
      @second_comment.save
      @third_comment = Comment.create(post: @post, author: @first_user, text: 'Hi Lilly!', created_at: 13.day.ago)
      @third_comment.save
      @fourth_comment = Comment.create(post: @post, author: @second_user, text: 'Hi Lilly!', created_at: 12.day.ago)
      @fourth_comment.save
      @fifth_comment = Comment.create(post: @post, author: @second_user, text: 'Hi Lilly!', created_at: 11.day.ago)
      @fifth_comment.save
      @sixth_comment = Comment.create(post: @post, author: @second_user, text: 'Hi Lilly!', created_at: 10.day.ago)
      @sixth_comment.save

      expect(@post.recent_comments.length).to eq(5)
    end
  end
end
