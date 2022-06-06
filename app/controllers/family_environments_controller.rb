class FamilyEnvironmentsController < ApplicationController
  before_action :set_family_environment, only: %i[ show edit update destroy ]

  # GET /family_environments or /family_environments.json
  def index
    @family_environments = FamilyEnvironment.all
    # @family_environments = FamilyEnvironment.includes(:student).where(family_environment_id: current_user.id)
  end

  # GET /family_environments/1 or /family_environments/1.json
  def show
  end

  # GET /family_environments/new
  def new
    @family_environment = FamilyEnvironment.new
  end

  # GET /family_environments/1/edit
  def edit
  end

  # POST /family_environments or /family_environments.json
  def create
    @family_environment = FamilyEnvironment.new(family_environment_params)

    respond_to do |format|
      if @family_environment.save
        format.html { redirect_to family_environment_url(@family_environment), notice: "Family environment was successfully created." }
        format.json { render :show, status: :created, location: @family_environment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family_environment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_environments/1 or /family_environments/1.json
  def update
    respond_to do |format|
      if @family_environment.update(family_environment_params)
        format.html { redirect_to family_environment_url(@family_environment), notice: "Family environment was successfully updated." }
        format.json { render :show, status: :ok, location: @family_environment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family_environment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_environments/1 or /family_environments/1.json
  def destroy
    @family_environment.destroy

    respond_to do |format|
      format.html { redirect_to family_environments_url, notice: "Family environment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_environment
      @family_environment = FamilyEnvironment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_environment_params
      params.require(:family_environment).permit(:relationship, :name, :birthday, :age, :family, :student_id)
    end
end
