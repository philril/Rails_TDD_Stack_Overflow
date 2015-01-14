# require 'faker'

FactoryGirl.define do

  factory :question do
    title "I am a title"
    content "I am some content"
    votes 0
  end

  factory :answer do
    title "I am an answer!"
    content "Here is the answer"
    votes 0
  end

end

