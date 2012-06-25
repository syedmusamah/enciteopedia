class EditorsController < ApplicationController
  # GET /articles
  # GET /articles.json
helper_method :sort_column, :sort_direction

  def index
  @editors = Editor.all
  @thumbs = Hist.where("Editor_id = ?", params[:id])
  
   end
  def like
	@article = Hist.find(params[:id])
        @hist = Hist.find(params[:id])
	@voter = Editor.find(session[:remember_token])
        @votee = Editor.find_by_id(Hist.select(:editor_id).where("Article_id = ?", @article))
  		@voter.vote_for(@votee)
  		redirect_to editors_path, :notice => "you now like this edit"
  end

  def unlike
	@a = Hist.find(params[:id])
        @hist = Hist.find(params[:id])
	@voter = Editor.find(session[:remember_token])
        @votee = Editor.find_by_id(Hist.select(:editor_id).where("Id = ?", @a))
  		@voter.vote_against(@votee)
  		redirect_to editors_path, :notice => "you now like this edit"
  end
 


  # GET /articles/1
  # GET /articles/1.json
  def show
    @editor = Editor.find(params[:id])
    @aeor = Aeor.find_all_by_editor_id(params[:id])
    @aarticles = Array.new
    @aeor.each do |a|
    @aarticles.push( Article.find_by_id(a.article_id))
   end
   
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @editor = Editor.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editor }
    end
  end

  # GET /articles/1/edit
  def edit
    @editor = Editor.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @editor = Editor.new(params[:editor])
    respond_to do |format|
      if @editor.save
        format.html { redirect_to @editor, notice: 'Article was successfully created.' }
        format.json { render json: @editor, status: :created, location: @editor }
      else
        format.html { render action: "new" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @editor = Editor.find(params[:id])

    respond_to do |format|
      if @editor.update_attributes(params[:editor])
        format.html { redirect_to @editor, notice: 'Editor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @editor = Editor.find(params[:id])
    @editor.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
  helper_method :current_editor #make this method available in views
private  
  def sort_column
    Article.column_names.include?(params[:sort]) ? params[:sort] : "hits"
  end

  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
