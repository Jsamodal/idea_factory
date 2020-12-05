class LikesController < ApplicationController
    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea: idea, user: current_user)

        if like.save
            flash[:success] = "Question liked"
             
        else
            flash[:danger] =like.errors.full_messages.join(", ")
        end
        redirect_to idea_path(idea)
    end
    def destroy
        like = like.find_by(idea: params[idea: idea_id], user: current_user)
        like.destroy
       redirect_to idea_path(like.idea)
    end

end
