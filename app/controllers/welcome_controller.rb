class WelcomeController < ApplicationController
  def index
    @trainings = Training.all
  end
end
