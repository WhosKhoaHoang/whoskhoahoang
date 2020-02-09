class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    
    
    #NOTE: show, edit, update are already special RoR keywords?
    #Post show page path: [domain]/post/[post_id]
    def show
        @post = Post.find(params[:id]) #I.e., GET params
        #^This variable becomes visible in show.html.erb
    end
    
    
    #Post edit page path: [domain]/post/[post_id]/edit
    def edit
        @post = Post.find(params[:id])
        #^This variable becomes visible in edit.html.erb
    end
    
    
    def create #Associated with a (HTTP) POST action?
        #render plain: params[:post].inspect
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post was successfully created"
            redirect_to post_path(@post)
        else
            render "new" #I.e., new.html.erb
        end
    end
    
    
    def update #Also associated with a (HTTP) POST action?
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post was updated!"
            redirect_to post_path(@post)
        else
            flash[:notice] = "Post was not updated"
            render "edit" #I.e., edit.html.erb
        end
    end
    
    
    private
        def post_params
            params.require(:post).permit(:title, :description)
        end
end