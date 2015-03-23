require 'rails_helper'

  describe "Answer Feature Test" do

    context "save answer" do
      it "should save the answer" do
        @question = create(:question)
        @answer = create(:answer)

        visit question_path(@question)
          fill_in 'Title', :with => @answer.title
          fill_in 'Content', :with => @answer.content
          click_button 'Save Answer'
        expect(page).to have_content(@answer.title)
      end
    end

    # describe "API Test" do

    # context "generate quote" do
    #   it "displays a randomly generated quote" do
    #    end
    # end

  end