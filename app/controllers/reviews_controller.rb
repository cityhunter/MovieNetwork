class ReviewsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    #@review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    #@review = Review.new   
    @review.author = current_user.email 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end

    
    
  end

  # GET /reviews/1/edit
  def edit
    #@review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])
    authorize! :create, @review
    #redirect_to movie_path(@movie)
    #@review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @reviews }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    #@review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
    #@review = Review.find(params[:id])
    #@review.destroy

    #respond_to do |format|
      #format.html { redirect_to reviews_url }
      #format.json { head :ok }
    #end
  end


end
