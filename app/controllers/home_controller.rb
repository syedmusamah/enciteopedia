class HomeController < ApplicationController
   respond_to :html
   helper_method :sort_column, :sort_direction
  # GET /articles
  # GET /articles.json
  def index
  @editors = Editor.all
  @vote = Vote.all
  @articles = Article.order(sort_column + " " + sort_direction)
  @aeor = Aeor.find_all_by_editor_id(session[:remember_token]).uniq
  @rarticles = Array.new
  @aeor.each do |a|
   @rarticles.push( Article.find_by_id(a.article_id))
  end
  end
    def top
  @items = Editor.tally()
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article.hits += 1
    @article.save
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.hits == 0
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.hits = 0
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
private  
  def sort_column
    Article.column_names.include?(params[:sort]) ? params[:sort] : "hits"
  end

  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
