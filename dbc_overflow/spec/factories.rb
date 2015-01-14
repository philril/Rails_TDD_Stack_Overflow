# require 'faker'

FactoryGirl.define do
  factory :question do
    title "I am a title"
    content "I am some content"
    votes 0
  end
end