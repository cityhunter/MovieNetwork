class CommentsController < ApplicationController
  load_and_authorize_resource 
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    #@comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    #@comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    #@comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create

    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(params[:comment])
    authorize! :create, @comment
    @comment.date = Time.now
    #@movie = Movie.find(params[:movie_id])
    #redirect_to review_path(@review)
    #@comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to review_path(@review), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    #@comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @review = Review.find(params[:review_id])
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    redirect_to review_path(@review)
    #@comment = Comment.find(params[:id])
    #@comment.destroy

    #respond_to do |format|
      #format.html { redirect_to comments_url }
      #format.json { head :ok }
    #end
  end
end
