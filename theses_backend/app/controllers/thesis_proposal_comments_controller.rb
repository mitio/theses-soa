class ThesisProposalCommentsController < ApplicationController
  # GET /thesis_proposal_comments
  # GET /thesis_proposal_comments.xml
  def index
    @thesis_proposal_comments = ThesisProposalComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thesis_proposal_comments }
    end
  end

  # GET /thesis_proposal_comments/1
  # GET /thesis_proposal_comments/1.xml
  def show
    @thesis_proposal_comment = ThesisProposalComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thesis_proposal_comment }
    end
  end

  # GET /thesis_proposal_comments/new
  # GET /thesis_proposal_comments/new.xml
  def new
    @thesis_proposal_comment = ThesisProposalComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thesis_proposal_comment }
    end
  end

  # GET /thesis_proposal_comments/1/edit
  def edit
    @thesis_proposal_comment = ThesisProposalComment.find(params[:id])
  end

  # POST /thesis_proposal_comments
  # POST /thesis_proposal_comments.xml
  def create
    @thesis_proposal_comment = ThesisProposalComment.new(params[:thesis_proposal_comment])

    respond_to do |format|
      if @thesis_proposal_comment.save
        format.html { redirect_to(@thesis_proposal_comment, :notice => 'ThesisProposalComment was successfully created.') }
        format.xml  { render :xml => @thesis_proposal_comment, :status => :created, :location => @thesis_proposal_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thesis_proposal_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thesis_proposal_comments/1
  # PUT /thesis_proposal_comments/1.xml
  def update
    @thesis_proposal_comment = ThesisProposalComment.find(params[:id])

    respond_to do |format|
      if @thesis_proposal_comment.update_attributes(params[:thesis_proposal_comment])
        format.html { redirect_to(@thesis_proposal_comment, :notice => 'ThesisProposalComment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thesis_proposal_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thesis_proposal_comments/1
  # DELETE /thesis_proposal_comments/1.xml
  def destroy
    @thesis_proposal_comment = ThesisProposalComment.find(params[:id])
    @thesis_proposal_comment.destroy

    respond_to do |format|
      format.html { redirect_to(thesis_proposal_comments_url) }
      format.xml  { head :ok }
    end
  end
end
