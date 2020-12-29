class ParticipantsController < ApplicationController
    def create
        @participant = current_user.participants.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end
    
    

    def cancel
            user=User.find(params[:id])
            @post = Post.find(params[:id])
            @cancel=user.participants.find_by(post_id: @post.id)
            @cancel.destroy
        redirect_to :root
    end
        

    # def destroy
    #         @participant = Participant.find_by(post_id: params[:post_id], user_id: current_user.id)
    #         @participant.destroy
    #         redirect_back(fallback_location: root_path)
    # end

    def destroy
        @participant = Participant.find_by(post_id: params[:post_id],user_id: current_user.id)
        @participant.destroy
        redirect_back(fallback_location: root_path)
    end


end

