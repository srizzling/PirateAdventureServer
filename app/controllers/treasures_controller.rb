class TreasuresController < InheritedResources::Base
def index
    @treasures = Treasure.all
    respond_to do |format|
    	format.html
    	format.json {render :json => @treasures}
    	format.xml {render :xml => @treasures}
    end
end

def show
    @treasure = Treasure.find(params[:id])
        respond_to do |format|
    	format.html
    	format.json {render :json => @treasure}
    	format.xml {render :xml => @treasure}
    end
  end

  def new
    @treasure = Treasure.new
    respond_to do |format|
    	format.html
    	format.json {render :json => @treasure}
    	format.xml {render :xml => @treasure}
    end
  end

  def create
    @treasure = Treasure.new(params[:treasure])
    respond_to do |format|
    if @treasure.save
      format.html {redirect_to(@treasure, :notice => "Treasure was sucessfully made!")}
      format.json {render :json => @treasure, :status => :created, :location =>treasure}
    else
      format.html{render :action => 'new'}
      format.json{render :json => @treasure.errors, :status => :unprocessable_entity}
    end
end
  end

  def edit
    @treasure = Treasure.find(params[:id])
  end

  def update
    @treasure = Treasure.find(params[:id])
    if @treasure.update_attributes(params[:treasure])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => 'show', :id => @treasure
    else
      render :action => 'edit'
    end
  end

  def destroy
    Treasure.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
	
end

