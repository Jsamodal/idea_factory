class WelcomeController < ApplicationController
    def index
        @idea = Idea.all
        @user = User.all
    end
end