class ReviewsController < ApplicationController
    before_action :authenticate_user!
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
        if can?(:crud,@review)
            @review.destroy
            redirect_to idea_path(@review.idea)
            else
                head :unauthorized
            end
    end   
end
