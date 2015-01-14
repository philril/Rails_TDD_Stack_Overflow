require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "fields" do
    let(:question_params) { attributes_for(:question) }

    before :each do
    @question = create(:question)
        post :index
        post :create, id: @question, :question => question_params
    end
    it "has a title field" do
      expect(@question.title).to eq("I am a title")
    end
    it "has a content field" do
      expect(@question.content).to eq("I am some content")
    end
    it "has a votes field" do
      expect(@question.votes).to eq(0)
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
      it "edit/updates a question" do
        post :index

        @question = create(:question)

        patch :update, id: @question, :question => question_params
        expect(@question.title).to eq("I am a title")
        expect(@question.content).to eq("I am some content")

      end
    end
  end

  describe "votes" do

    before :each do
    @question = create(:question)
      post :index
    end

    context "#upvote" do
      it "should increase vote count by 1" do
        @question = create(:question)
        num = @question.votes
        post :upvote, id: @question.id
        @question.reload
        expect(@question.votes).to eq(num + 1)
      end
    end

    context "#downvote" do
      it "should decrease vote count by 1" do
        @question = create(:question)
        num = @question.votes
        post :downvote, id: @question.id
        @question.reload
        expect(@question.votes).to eq(num - 1)
      end
    end
  end

end
