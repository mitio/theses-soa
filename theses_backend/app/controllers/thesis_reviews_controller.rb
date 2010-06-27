class ThesisReviewsController < ApplicationController
  # GET /thesis_reviews
  # GET /thesis_reviews.xml
  def index
    @thesis_reviews = ThesisReview.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thesis_reviews }
    end
  end

  # GET /thesis_reviews/1
  # GET /thesis_reviews/1.xml
  def show
    @thesis_review = ThesisReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thesis_review }
    end
  end

  # GET /thesis_reviews/new
  # GET /thesis_reviews/new.xml
  def new
    @thesis_review = ThesisReview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thesis_review }
    end
  end

  # GET /thesis_reviews/1/edit
  def edit
    @thesis_review = ThesisReview.find(params[:id])
  end

  # POST /thesis_reviews
  # POST /thesis_reviews.xml
  def create
    @thesis_review = ThesisReview.new(params[:thesis_review])

    respond_to do |format|
      if @thesis_review.save
        format.html { redirect_to(@thesis_review, :notice => 'ThesisReview was successfully created.') }
        format.xml  { render :xml => @thesis_review, :status => :created, :location => @thesis_review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thesis_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thesis_reviews/1
  # PUT /thesis_reviews/1.xml
  def update
    @thesis_review = ThesisReview.find(params[:id])

    respond_to do |format|
      if @thesis_review.update_attributes(params[:thesis_review])
        format.html { redirect_to(@thesis_review, :notice => 'ThesisReview was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thesis_review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thesis_reviews/1
  # DELETE /thesis_reviews/1.xml
  def destroy
    @thesis_review = ThesisReview.find(params[:id])
    @thesis_review.destroy

    respond_to do |format|
      format.html { redirect_to(thesis_reviews_url) }
      format.xml  { head :ok }
    end
  end
end
