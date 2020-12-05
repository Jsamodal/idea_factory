class WelcomeController < ApplicationController
    def index
        @idea = Idea.all
    end
end