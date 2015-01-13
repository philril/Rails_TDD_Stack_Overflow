require 'rails_helper'

RSpec.describe "question/index.html.erb", :type => :view do
  it "shows all questions" do
    assign(:questions, [instance_double("Question", title: "hey", content: "you"), instance_double("Question", title: "dang", content: "it")])
    render
    expect(rendered).to include("dang")
  end
end
