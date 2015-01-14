class AnswersController < ApplicationController

  def create
    @this_question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @this_question.answers << @answer

    redirect_to question_path(@this_question)
  end


private
  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end

end
