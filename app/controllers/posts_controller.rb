class PostsController < ApplicationController

    before_action :set_post, only: [:edit, :update, :show, :destroy]
    
    #This is the index of the "posts directory". This
    #means that the page can be accessed by simply
    #specifying [domain]/posts/
    def index
        @posts = Post.paginate(page: params[:page], per_page: 5)
    end

    
    def new
        @post = Post.new
    end
    
    
    #NOTE: show, edit, update are already special RoR keywords?
    #Post show page path: [domain]/posts/[post_id]
    def show
        #@post = Post.find(params[:id]) #I.e., GET params
        #^This variable becomes visible in show.html.erb
        ## No longer need to define @post because of before_action up there ^ ##
    end
    
    
    #Post edit page path: [domain]/posts/[post_id]/edit
    def edit
        #@post = Post.find(params[:id])
        #^This variable becomes visible in edit.html.erb
        ## No longer need to define @post because of before_action up there ^ ##
    end
    
    
    def create #Associated with a (HTTP) POST action?
        #render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user = User.first
        if @post.save
            flash[:success] = "Post was successfully created"
            redirect_to post_path(@post)
        else
            render "new" #I.e., new.html.erb
        end
    end
    
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Post was deleted"
        redirect_to posts_path
    end
    
    
    def update #Also associated with a (HTTP) POST action?
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "Post was updated!"
            redirect_to post_path(@post)
        else
            flash[:success] = "Post was not updated"
            render "edit" #I.e., edit.html.erb
        end
    end
    
    
    private
        def post_params
            params.require(:post).permit(:title, :description)
        end
    
        def set_post
            @post = Post.find(params[:id])
        end
end