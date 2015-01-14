require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

describe "fields" do
    let(:answer_params) { attributes_for(:answer) }

    before :each do
    @question = create(:question)
    @answer = create(:answer)
        post :create, question_id: @question.id , :answer => answer_params
    end

    it "has a title field" do
      expect(@answer.title).to eq("I am an answer!")
    end

    it "has a content field" do
      expect(@answer.content).to eq("Here is the answer")
    end

    it "is associated with a question" do
      expect(@question.answers.first.question_id).to eq(@question.id)
    end
  end


  describe "votes" do

    let(:answer_params) { attributes_for(:answer) }

    before :each do
      @question = create(:question)
      @answer = create(:answer)
          post :create, question_id: @question.id , :answer => answer_params
    end

    context "#upvote" do
      @answer = create(:answer)
      num = @answer.votes
      post :upvote, id: @answer.id
      @answer.reload
      expect(@answer.votes).to eq(num + 1)
    end

    context "#downvote" do

    end
  end

end
