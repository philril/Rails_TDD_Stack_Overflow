require 'rails_helper'
# require 'factory_girl'

RSpec.describe "questions/show.html.erb", :type => :view do

  it "shows a specific question" do
    @question = build(:question)

    render
    expect(rendered).to include("I am some content")
  end

  it "shows a create answer form" do
    @question = build(:question)

    render
    expect(view).to render_template(:partial => "_answer_form")
  end

end
