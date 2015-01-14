class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to questions_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  flash[:success] = "Question Deleted"
    redirect_to root_path
  end

private
  def question_params
    params.require(:question).permit(:title, :text)
  end

end
