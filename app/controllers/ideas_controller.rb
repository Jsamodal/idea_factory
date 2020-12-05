class IdeasController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, ]
    before_action :find_idea, only:[:destroy, :edit, :update, :show]
    def index
        @idea = Idea.all
    end
    
    def new
        @idea = Idea.new
        
    end

    def create
       
        @idea = Idea.new params.require(:idea).permit(:title, :body)
            if @idea.save
                flash[:notice] = "Blog created successfully"
                redirect_to idea_path(@idea)
            else
                render :new
            end

               
    end

    def show
        @idea = Idea.find params[:id]
        @review = Review.new
        @reviews = @idea.reviews
      
    end

    def edit
        @idea = Idea.find params[:id]
       
    end

    def update
        @idea = Idea.find params[:id]
        
        if @idea.update params.require(:idea).permit(:title, :body)
            @idea.save
            redirect_to idea_path(@idea)
        else
            render :edit    
        end
    
    end

    def destroy
        @idea = Idea.find params[:id]
               @idea.destroy
               redirect_to root_path
    end
    private
    def find_idea
        @idea = Idea.find params[:id]
    end
   
end   

