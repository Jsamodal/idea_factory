class LikesController < ApplicationController
    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea: idea, user: current_user)
            if(!can?(:like, idea))
                if like.save
                    flash[:success] = "Question liked"
             
                else
                    flash[:danger] =like.errors.full_messages.join(", ")
                end
                    redirect_to root_path(idea)
            end
    end
    def destroy
        if !(can?(:destroy, like))
            like = current_user.likes.find params[:id]
            like.destroy
            redirect_to idea_path(like.idea)
        end
    end

end
