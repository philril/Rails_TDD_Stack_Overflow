require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "create" do
    let(:question_params) { attributes_for(:question) }
      context "#create" do
        it "creates a new question" do

          post :index

          expect {
            post :create, :question => question_params
          }.to change(Question, :count).by(1)
        end
      end
  end

  describe "delete" do
    context "#delete" do
      it "deletes a question" do

        @question = create(:question)

        post :index

        expect{
          delete :destroy, :id => @question.id
        }.to change(Question, :count).by(-1)
      end
    end
  end

  describe "edit" do
    let(:question_params) { attributes_for(:question) }
    context "#edit" do
      it "edits a question" do
        post :index

        @question = create(:question)

          patch :update, id: @question, :question => question_params
        expect(@question.title).to eq("I am a title")

      end
    end
  end

end
