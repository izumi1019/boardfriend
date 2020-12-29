class PostsController < ApplicationController

    def index
        @search = Post.search(params[:q]) # この行を追加
        @posts = @search.result #この行を修正
    
        respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
                #if params[:search] != nil && params[:search] != ''
                #部分検索かつ複数検索
                #@posts = Post.where("location LIKE ? ", "%" + params[:search] + "%").or(Post.where("date LIKE ? ", "%" + params[:search] + "%"))
                #else
                #@posts = Post.all
                end
        end
    #@posts = Post.all
    

def new 
    @post=Post.new
end

def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
        redirect_to :action => "index"
    else
        redirect_to :action => "new"
    end
end

def show
    @post = Post.find(params[:id])
    @participant = Participant.new
    @like = Like.new
end

def records
    @list = Post.where(user: current_user)
end

def edit
    @post = Post.find(params[:id])
end

    def  update
        @post = Post.find(params[:id])
        if @post.update(post_params)
        redirect_to :action => "show", :id => @post.id
        else
        redirect_to :action => "new"
        end
    end

    def destroy
        Post.find(params[:id]).destroy
    redirect_to action: :index
    end

    def address

    end

def map
            results = Geocoder.search(params[:location])
            @latlng = results.first.coordinates
            # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
        
            respond_to do |format|
            format.js
end

end

before_action :authenticate_user!

private
def post_params
    params.require(:post).permit(:body,:title,:date,:capacity,:location,:remarks,:explanation)
end


end

