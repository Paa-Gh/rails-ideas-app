require "rails_helper"

RSpec.describe CategoriesController, :type => :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "does not create new category" do
        sign_in nil
        expect {
          post :create, :params => { :category => { :name => "Any Name" } }
        }.to change(Category, :count).by(0)
      end
      it "create new category" do
        sign_in
        expect {
          post :create, :params => { :category => { :name => "Any Name" } }
        }.to change(Category, :count).by(1)
      end
      it "redirects to the new category" do
        sign_in
          post :create, :params => { :category => { :name => "Any Name" } }
          expect(response).to redirect_to Category.last
      end

    end
  end
end
