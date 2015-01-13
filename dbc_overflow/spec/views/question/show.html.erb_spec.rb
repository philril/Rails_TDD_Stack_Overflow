require 'rails_helper'

RSpec.describe "question/show.html.erb", :type => :view do
  it "shows a specific question" do
    assign(:question, instance_double("Question", title: "Rspec Sucks. Help.", content: "for realz"))
    render
    expect(rendered).to include("for realz")
  end
end
