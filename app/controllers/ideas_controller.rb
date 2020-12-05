class IdeasController < ApplicationController
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

   
end   

