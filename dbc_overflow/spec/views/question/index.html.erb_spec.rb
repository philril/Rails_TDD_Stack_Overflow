require 'rails_helper'

RSpec.describe "question/index.html.erb", :type => :view do

  before :each do
    assign(:questions, [instance_double("Question", title: "hey", content: "you"), instance_double("Question", title: "dang", content: "it")])
  end

  it "shows all questions" do
    render
    expect(rendered).to include("dang")
  end

  it "should render new question form" do
    expect(view).to render_template(:partial => "_form")
  end
end
