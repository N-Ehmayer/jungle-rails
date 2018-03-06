require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should save if all fields are valid' do
      user = User.new({name: "Bob", email: "example@email.com", password: "password"})
      expect{ user.save }.to change { User.count }
    end

    it 'should have a name' do
      user = User.new({name: nil, email: "example@email.com", password: "password"})
      user.save
      expect(user.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it 'should have an email' do
      user = User.new({name: "Bob", email: nil, password: "password"})
      user.save
      expect(user.errors.full_messages[0]).to eql("Email can't be blank")
    end

    it 'should have a password' do
      user = User.new({name: "Bob", email: "example@email.com", password: nil})
      user.save
      expect(user.errors.full_messages[0]).to eql("Password can't be blank")
    end

    it 'password should be atleast 5 characters' do
      user = User.new({name: "Bob", email: "example@email.com", password: "pass"})
      user.save
      expect(user.errors.full_messages[0]).to eql("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user = User.new({name: "Bob", email: "example@email.com", password: "password"})
      @user.save
    end

    it 'should return user instance if credentials are authenticated' do
      expect(@user = User.authenticate_with_credentials("example@email.com",
                                                         "password")).to eql(@user)
    end

    it 'should return nul if email does not match' do
      expect(@user = User.authenticate_with_credentials("example123@email.com",
                                                         "password")).to be_nil
     end

     it 'should return nul if password does not match' do
       expect(@user = User.authenticate_with_credentials("example@email.com",
                                                         "wrongpass")).to be_nil
     end
  end
end
