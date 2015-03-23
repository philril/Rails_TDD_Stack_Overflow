require 'rails_helper'

RSpec.describe "questions/index.html.erb", :type => :view do
  it "shows all questions" do
    @questions = create_list(:question, 25)

    render
    expect(rendered).to include("I am a title")
  end

  it "renders _question_form partial" do
    @questions = create_list(:question, 25)

    render
    expect(view).to render_template(:partial => "_question_form")
  end
end
