require 'rails_helper'
RSpec.describe Idea, type: :model do
  before(:all) do
    @user = User.create(email: Faker::Internet.email, password: "church")
    @category = Category.create(name:"minstry")
  end

  it "user is valid with no category" do
    expect(@user).to be_truthy
  end

  it "is valid" do
    idea = Idea.create(name:"check", content: Faker::Name.name, category_id: @category.id, user_id: @user.id)
    expect(idea).to be_valid
  end

  it "empty idea name is not valid" do
    idea = Idea.create(name:"", content: Faker::Name.name, category_id: @category.id, user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "empty idea content is valid" do
    idea = Idea.create(name:"check", content: "", category_id: @category.id, user_id: @user.id)
    expect(idea).to be_valid
  end

  it "no Idea category is not valid" do
    idea = Idea.create(name:"check", content: Faker::Name.name, category_id: "", user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "no Idea user is not valid" do
    idea = Idea.create(name:"check", content: Faker::Name.name, category_id: @category_id, user_id: "")
    expect(idea).not_to be_valid
  end

  it "no Idea content and category is not valid" do
    idea = Idea.create(name:"check", content: "", category_id: "", user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "no Idea content and user is not valid" do
    idea = Idea.create(name:"check", content: "", category_id: @category_id, user_id: "")
    expect(idea).not_to be_valid
  end

  it "no Idea category and user is not valid" do
    idea = Idea.create(name:"check", content: Faker::Name.name, category_id: "", user_id: "")
    expect(idea).not_to be_valid
  end

  it "empty idea name and content is not valid" do
    idea = Idea.create(name:"", content: "", category_id: @category.id, user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "empty idea name and category is not valid" do
    idea = Idea.create(name:"", content: Faker::Name.name, category_id: "", user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "empty idea name and user is not valid" do
    idea = Idea.create(name:"", content: Faker::Name.name, category_id: @category.id, user_id: "")
    expect(idea).not_to be_valid
  end

  it "empty idea name, category and user is not valid" do
    idea = Idea.create(name:"", content: Faker::Name.name, category_id: "", user_id: "")
    expect(idea).not_to be_valid
  end

  it "empty idea name, content and category is not valid" do
    idea = Idea.create(name:"", content: "", category_id: "", user_id: @user.id)
    expect(idea).not_to be_valid
  end

  it "empty idea name, content and user is not valid" do
    idea = Idea.create(name:"", content: "", category_id: @category_id, user_id: "")
    expect(idea).not_to be_valid
  end

  it "all empty idea fields is not valid" do
    idea = Idea.create(name: "", content: "", category_id: "", user_id: "")
    expect(idea).not_to be_valid
  end

end
