class AnswersController < ApplicationController

  def create
    @this_question = Question.find(@question.id)
    @answer = Answer.new(answer_params)
    @this_question.answers << @answer

    redirect_to question_path(@this_question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    @answer.upvote
    redirect_to @question
  end


private
  def answer_params
    params.require(:answer).permit(:title, :content, :question_id)
  end

end
