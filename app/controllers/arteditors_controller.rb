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

  # GET /arteditors/1
  # GET /arteditors/1.json
  def show
    @veditor = Veditor.find(params[:id])

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
    @veditor = Veditor.find(params[:id])
  end

  # POST /arteditors
  # POST /arteditors.json
  def create
    @veditor = Editor.new(params[:veditor])

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
    @veditor = Veditor.find(params[:id])

    respond_to do |format|
      if @arteditor.update_attributes(params[:arteditor])
        format.html { redirect_to @arteditor, notice: 'Arteditor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @arteditor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arteditors/1
  # DELETE /arteditors/1.json
  def destroy
    @veditor = Veditor.find(params[:id])
    @veditor.destroy

    respond_to do |format|
      format.html { redirect_to arteditors_url }
      format.json { head :ok }
    end
  end
end
