class ReviewsController < ApplicationController
    def create
        @idea = Idea.find params[:idea_id]
        @review =Review.new params.require(:review).permit(:body)
        @review.idea = @idea
        if @review.save
            redirect_to idea_path(@idea)
        else
            render 'ideas/show'    
    
        end
    end
    
    
    def destroy
        @review= Review.find params[:id]
        
       
        @comment.destroy
        redirect_to idea_path(@review.blog)
       
    end   
end
