require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "delete" do
    it "deletes a question" do
    @question = build(:question)

    get :show
    expect{delete :destroy, :id => @question.to_param}.to change(Question, :count).by(-1)
    end
  end

end
