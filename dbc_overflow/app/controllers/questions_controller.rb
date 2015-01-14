class QuestionsController < ApplicationController

  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote
    redirect_to root_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote
    redirect_to root_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = "Question Deleted"
    redirect_to root_path
  end

private
  def question_params
    params.require(:question).permit(:title, :content, :votes)
  end

end
