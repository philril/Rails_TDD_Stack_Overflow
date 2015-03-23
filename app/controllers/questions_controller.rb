require 'httparty'
require 'json'

class QuestionsController < ApplicationController
  # include HTTParty

  def index
    @questions = Question.all.sort_by(&:created_at).reverse
    quote = HTTParty.get("https://api.github.com/zen",
      headers: {"User-Agent" => "philril", "access_token" => ENV['GITHUB_API']},
    )

    canned_response = [
      "Shitty quote",
      "Some quote stuff",
      "Some super inspirational quote stuff",
      "Blah blah blah"
    ]

    if quote.headers['status'] == "403 Forbidden"
      @quote = "'#{canned_response.shuffle.pop}'"
    else
      @quote = "'#{quote.body}'"
    end

  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html {redirect_to @question}
        format.js {}
        format.json {render json: @question, status :created, location: @question}
      else
        format.html {render action: "new"}
        format.json {render json @question.errors}
      end
      end

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
