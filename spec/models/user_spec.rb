require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Footballer from England')
      @user.save
    end

    it 'name should have a value' do
      expect(@user).to be_valid
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'post_counter should be an integer' do
      @user.post_counter = nil
      expect(@user).to_not be_valid
    end

    it 'post_counter should be greater than or equal to zero' do
      @user.post_counter = -1
      expect(@user).to_not be_valid
    end
  end

  describe 'recent_posts function' do
    it 'returns posts that equal 2' do
      user = User.new(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Footballer from England')
      user.save
      Post.create(author: user, title: 'First post', text: 'Hello world!', created_at: 10.day.ago)
      Post.create(author: user, title: 'Second post', text: 'Rails is amazing', created_at: 15.day.ago)

      expect(user.recent_posts.length).to eq(2)
    end
  end
end
