class PhdSupervisorRelationsController < ApplicationController
  # GET /phd_supervisor_relations
  # GET /phd_supervisor_relations.json
  def index
    @phd_supervisor_relations = PhdSupervisorRelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @phd_supervisor_relations }
    end
  end

  # GET /phd_supervisor_relations/1
  # GET /phd_supervisor_relations/1.json
  def show
    @phd_supervisor_relation = PhdSupervisorRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @phd_supervisor_relation }
    end
  end

  # GET /phd_supervisor_relations/new
  # GET /phd_supervisor_relations/new.json
  def new
    @phd_supervisor_relation = PhdSupervisorRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @phd_supervisor_relation }
    end
  end

  # GET /phd_supervisor_relations/1/edit
  def edit
    @phd_supervisor_relation = PhdSupervisorRelation.find(params[:id])
  end

  # POST /phd_supervisor_relations
  # POST /phd_supervisor_relations.json
  def create
    @phd_supervisor_relation = PhdSupervisorRelation.new(params[:phd_supervisor_relation])

    respond_to do |format|
      if @phd_supervisor_relation.save
        format.html { redirect_to @phd_supervisor_relation, :notice => 'Phd supervisor relation was successfully created.' }
        format.json { render :json => @phd_supervisor_relation, :status => :created, :location => @phd_supervisor_relation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @phd_supervisor_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phd_supervisor_relations/1
  # PUT /phd_supervisor_relations/1.json
  def update
    @phd_supervisor_relation = PhdSupervisorRelation.find(params[:id])

    respond_to do |format|
      if @phd_supervisor_relation.update_attributes(params[:phd_supervisor_relation])
        format.html { redirect_to @phd_supervisor_relation, :notice => 'Phd supervisor relation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @phd_supervisor_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phd_supervisor_relations/1
  # DELETE /phd_supervisor_relations/1.json
  def destroy
    @phd_supervisor_relation = PhdSupervisorRelation.find(params[:id])
    @phd_supervisor_relation.destroy

    respond_to do |format|
      format.html { redirect_to phd_supervisor_relations_url }
      format.json { head :no_content }
    end
  end
end
