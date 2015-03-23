require 'rails_helper'
require 'capybara/rspec'

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




end
