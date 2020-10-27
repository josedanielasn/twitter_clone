require 'rails_helper'

RSpec.describe User, type: :model do
  context "when validating a user" do
    let!(:user1) { FactoryBot.create :user }
    let(:taken_username) { FactoryBot.build :user, username: user1.username }
    let(:taken_email) { FactoryBot.build :user, email: user1.email }
    let(:blank_first_name) { FactoryBot.build :user, first_name: "" }
    let(:short_first_name) { FactoryBot.build :user, first_name: "a" }
    let(:blank_last_name) { FactoryBot.build :user, last_name: "" }
    let(:short_last_name) { FactoryBot.build :user, last_name: "a" }
    let(:blank_password) { FactoryBot.build :user, password: "" }
    
    it "is valid with valid attributes" do
      expect(user1).to be_valid
    end

    it "isn't valid when username is already taken" do
      expect(taken_username).to_not be_valid
    end

    it "isn't valid when email is already taken" do
      expect(taken_email).to_not be_valid
    end

    it "isn't valid when first_name is blank" do
      expect(blank_first_name).to_not be_valid
    end

    it "isn't valid when first_name is less than 2 characters" do
      expect(short_first_name).to_not be_valid
    end

    it "isn't valid when last_name is blank" do
      expect(blank_last_name).to_not be_valid
    end

    it "isn't valid when last_name is less than 2 characters" do
      expect(short_last_name).to_not be_valid
    end

    it "isn't valid when password is blank" do
      expect(blank_password).to_not be_valid
    end
  end
end
