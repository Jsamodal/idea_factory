class WelcomeController < ApplicationController
    def index
        @ideas = Idea.all
        user = User.all
        @current_user = current_user
    end
    
    def new
        @idea = Idea.new
        
    end

    def create
        @idea = Idea.find params[:id]
               
    end

  


 
    def destroy
        @idea = Idea.find params[:id]
        authorize_user!
        if can?(:crud, @idea)
            @idea.destroy
            redirect_to '/'
         else
             head :unauthorized
         end
    end
  
end