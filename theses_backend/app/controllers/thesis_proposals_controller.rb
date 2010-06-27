class ThesisProposalsController < ApplicationController
  # GET /thesis_proposals
  # GET /thesis_proposals.xml
  def index
    @thesis_proposals = ThesisProposal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thesis_proposals }
    end
  end

  # GET /thesis_proposals/1
  # GET /thesis_proposals/1.xml
  def show
    @thesis_proposal = ThesisProposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thesis_proposal }
    end
  end

  # GET /thesis_proposals/new
  # GET /thesis_proposals/new.xml
  def new
    @thesis_proposal = ThesisProposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thesis_proposal }
    end
  end

  # GET /thesis_proposals/1/edit
  def edit
    @thesis_proposal = ThesisProposal.find(params[:id])
  end

  # POST /thesis_proposals
  # POST /thesis_proposals.xml
  def create
    @thesis_proposal = ThesisProposal.new(params[:thesis_proposal])

    respond_to do |format|
      if @thesis_proposal.save
        format.html { redirect_to(@thesis_proposal, :notice => 'ThesisProposal was successfully created.') }
        format.xml  { render :xml => @thesis_proposal, :status => :created, :location => @thesis_proposal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thesis_proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thesis_proposals/1
  # PUT /thesis_proposals/1.xml
  def update
    @thesis_proposal = ThesisProposal.find(params[:id])

    respond_to do |format|
      if @thesis_proposal.update_attributes(params[:thesis_proposal])
        format.html { redirect_to(@thesis_proposal, :notice => 'ThesisProposal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thesis_proposal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thesis_proposals/1
  # DELETE /thesis_proposals/1.xml
  def destroy
    @thesis_proposal = ThesisProposal.find(params[:id])
    @thesis_proposal.destroy

    respond_to do |format|
      format.html { redirect_to(thesis_proposals_url) }
      format.xml  { head :ok }
    end
  end
end
