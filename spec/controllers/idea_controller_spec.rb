require "rails_helper"



RSpec.describe IdeasController, :type => :controller do

  it "blocks unauthenticated access" do
    sign_in nil
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows authenticated access" do
    sign_in
    get :index
    expect(response.status).to eq 200
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "does not create new idea" do
        sign_in nil
        expect {
          post :create, :params => { :idea => { :name => "check", :content => Faker::Name.name, :category_id => 1, :user_id => 1} }
        }.to change(Idea, :count).by(0)
      end
      it "create new idea" do
        sign_in
        expect {
          post :create, :params => { :idea => { :name => "check", :content => Faker::Name.name, :category_id => 1, :user_id => 1} }
        }.to change(Idea, :count).by(1)
      end
      it "redirects to the new idea" do
        sign_in
          post :create, :params => { :idea => { :name => "check", :content => Faker::Name.name, :category_id => 1, :user_id => 1} }
          expect(response).to redirect_to Idea.last
      end
    end
  end
end
