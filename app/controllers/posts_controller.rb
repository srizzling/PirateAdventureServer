class PostsController < InheritedResources::Base
skip_before_filter :verify_authenticity_token
def index
    @posts = Post.all
    
      respond_to do |wants|
       wants.html
       wants.xml { render :xml => @posts.to_xml }
       wants.json {render :json => @posts}
   end 
end

def show
    @post = Post.find(params[:id])
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:posts])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => 'show', :id => @post
    else
      render :action => 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
	
end
