# Release 1: Starting from scratch


### Learning Competencies

  - Understand how to create a Rails application from scratch
  - Understand how to create simple resources in Rails
  - Understand how to create non-standard views, routes, and resources in Rails

### Summary

  This week, we'll be building a substantial Rails application from the ground up: a [StackOverflow](stackoverflow.com) clone.  The goal is to focus on building a well-structured Rails application with a good mixture of front-end and back-end features.

  You are training to be a professional developer, and its time to start acting like one. For the remainder of this project, you should:

  ***Commit early and commit often.***  Commit on every feature completion, added dependency, and work stoppage. Commit with meaningful messages that accurately describe your alterations.

  ***TDD everything.*** You will not be writing a single line of code on this project before you've written a test for it. If you need to explore the tool before you start writing production code, work on spike branches. Every

  ***Be intentional about your time and learning.*** Focus on understanding every line of code that you write, and why you are writing it. The result should be a codebase that is clean, intentional, and ready for production.

 To create a new Rails application with a postgres database and without the default testing framework, run:

  ```text
    $ gem install rails

    $ rails new dbc_overflow -T -d=postgresql
  ```

  You'll need to install rspec-rails, capybara, shoulda-matchers, and factory-girl in your project.

  In your Gemfile:
  ```ruby
    group :development, :test do
      gem 'rspec-rails'
      gem 'capybara'
      gem 'shoulda-matchers'
      gem 'factory_girl_rails'
    end
  ```

  Then install rspec by running `rails g rspec:install`

  In your `rails_helper.rb`, within the `Rspec.configure` block, add `config.include Capybara::DSL`

  Take a look at the documentation for
[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) and
[factorygirl](https://github.com/thoughtbot/factory_girl_rails).

## Features

  - Create a valid readme with your project's intention.
  - Create your question and answer models. A question and an answer should have a title and a content.
  - Create a question index page that lists all questions.
  - Create a question show page that lists the question and all associated answers.
  - Modify your routes so your question index page is the root route.

