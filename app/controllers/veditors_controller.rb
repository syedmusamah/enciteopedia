class VeditorsController < ApplicationController
  # GET /arteditors
  # GET /arteditors.json
  def index
    @veditors = Veditor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @veditors }
    end
  end

   def like
	@voter = Editor.find(session[:remember_token])
        @votee = Veditor.find(params[:vid])
        if @voter.voted_for?(@votee) == false
  		@voter.vote_for(@votee)
  		redirect_to veditors_path, :notice => "you have voted for this veditor"
		
	else 
		redirect_to veditors_path, :notice => "you have already voted"
  end
  end
     def unlike
	@voter = Editor.find(session[:remember_token])
        @votee = Veditor.find(params[:vid])
        if @voter.voted_for?(@votee) == false
  		@voter.vote_against(@votee)
  		redirect_to veditors_path, :notice => "you have voted against this veditor"
		else 
		redirect_to veditors_path, :notice => "you have already voted"
        
  end
  end

  # GET /arteditors/1
  # GET /arteditors/1.json
  def show
    @veditor = Veditor.find(params[:vid])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @veditor }
    end
  end

  # GET /arteditors/new
  # GET /arteditors/new.json
  def new
    @veditor = Veditor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @veditor }
    end
  end

  # GET /arteditors/1/edit
  def edit
    @veditor = Veditor.find(params[:vid])
  end

  # POST /arteditors
  # POST /arteditors.json
  def create
    @veditor = Veditor.new(params[:veditor])

    respond_to do |format|
      if @veditor.save
        format.html { redirect_to @veditor, notice: 'Arteditor was successfully created.' }
        format.json { render json: @veditor, status: :created, location: @veditor }
      else
        format.html { render action: "new" }
        format.json { render json: @veditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arteditors/1
  # PUT /arteditors/1.json
  def update
    @veditor = Veditor.find(params[:vid])

    respond_to do |format|
      if @veditor.update_attributes(params[:veditor])
        format.html { redirect_to @veditor, notice: 'Arteditor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @veditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arteditors/1
  # DELETE /arteditors/1.json
  def destroy
    @veditor = Veditor.find(params[:id])
    @veditor.destroy

    respond_to do |format|
      format.html { redirect_to veditors_url }
      format.json { head :ok }
    end
  end

def approve
    @veditor = Veditor.find(params[:vid])
    @editor = Editor.new(:name => @veditor.name, :email =>@veditor.email, :password => @veditor.name)
    @editor.save
    @veditor.destroy


  end
end
