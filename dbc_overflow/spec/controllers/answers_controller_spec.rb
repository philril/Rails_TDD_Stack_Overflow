require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

describe "fields" do
    let(:answer_params) { attributes_for(:answer) }

    before :each do
      @answer = create(:answer)
    end

    it "has a title field" do
      expect(@answer.title).to eq("I am an answer!")
    end

    it "has a content field" do
      expect(@answer.content).to eq("Here is the answer")
    end

    # it "is associated with a question" do
    #   @answer = build(:answer)
    #   post :create, question_id: 7, :answer => answer_params
    #   expect(@answer.question_id).to eq(7)
    # end
  end

  describe "votes" do

    let(:answer_params) { attributes_for(:answer) }

    context "#upvote" do
      it "should increase the vote count by 1" do
        @question = create(:question)
        @answer = create(:answer)
            post :create, question_id: @question.id , :answer => answer_params

        num = @answer.votes
        post :upvote, id: @answer.id
        @answer.reload
        expect(@answer.votes).to eq(num + 1)
      end
    end

    context "#downvote" do

    end
  end

end
