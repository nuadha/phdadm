class SupervisorProgressDeclarationsController < ApplicationController
  # GET /supervisor_progress_declarations
  # GET /supervisor_progress_declarations.json
  def index
    @supervisor_progress_declarations = SupervisorProgressDeclaration.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supervisor_progress_declarations }
    end
  end

  # GET /supervisor_progress_declarations/1
  # GET /supervisor_progress_declarations/1.json
  def show
    @supervisor_progress_declaration = SupervisorProgressDeclaration.find(params[:id])
    @phd = User.find(@supervisor_progress_declaration.phd_id).name
    @supervisor = User.find(@supervisor_progress_declaration.supervisor_id).name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supervisor_progress_declaration }
    end
  end

  # GET /supervisor_progress_declarations/new
  # GET /supervisor_progress_declarations/new.json
  def new
    @supervisor_progress_declaration = SupervisorProgressDeclaration.new
    @phds = User.where(:role_id => Role.where(:role_name => "PhD Student"))
    @supervisors = User.where(:role_id => Role.where(:role_name => 'Supervisor'))

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supervisor_progress_declaration }
    end
  end

  # GET /supervisor_progress_declarations/1/edit
  def edit
    @supervisor_progress_declaration = SupervisorProgressDeclaration.find(params[:id])
    @phds = User.where(:role_id => Role.where(:role_name => "PhD Student"))
    @supervisors = User.where(:role_id => Role.where(:role_name => 'Supervisor'))

  end

  # POST /supervisor_progress_declarations
  # POST /supervisor_progress_declarations.json
  def create
    @supervisor_progress_declaration = SupervisorProgressDeclaration.new(params[:supervisor_progress_declaration])
    @phds = User.where(:role_id => Role.where(:role_name => "PhD Student"))
    @supervisors = User.where(:role_id => Role.where(:role_name => 'Supervisor'))

    respond_to do |format|
      if @supervisor_progress_declaration.save
        format.html { redirect_to @supervisor_progress_declaration, notice: 'Supervisor progress declaration was successfully created.' }
        format.json { render json: @supervisor_progress_declaration, status: :created, location: @supervisor_progress_declaration }
      else
        format.html { render action: "new" }
        format.json { render json: @supervisor_progress_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supervisor_progress_declarations/1
  # PUT /supervisor_progress_declarations/1.json
  def update
    @supervisor_progress_declaration = SupervisorProgressDeclaration.find(params[:id])
    @phds = User.where(:role_id => Role.where(:role_name => "PhD Student"))
    @supervisors = User.where(:role_id => Role.where(:role_name => 'Supervisor'))

    respond_to do |format|
      if @supervisor_progress_declaration.update_attributes(params[:supervisor_progress_declaration])
        format.html { redirect_to @supervisor_progress_declaration, notice: 'Supervisor progress declaration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supervisor_progress_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisor_progress_declarations/1
  # DELETE /supervisor_progress_declarations/1.json
  def destroy
    @supervisor_progress_declaration = SupervisorProgressDeclaration.find(params[:id])
    @supervisor_progress_declaration.destroy

    respond_to do |format|
      format.html { redirect_to supervisor_progress_declarations_url }
      format.json { head :no_content }
    end
  end
end
