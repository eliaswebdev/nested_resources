class TrimsController < ApplicationController
  before_action :set_make
  before_action :set_model
  before_action :set_trim, only: %i[show edit update destroy]

  # GET /trims or /trims.json
  def index
    @trims = @model.trims.all
  end

  # GET /trims/1 or /trims/1.json
  def show; end

  # GET /trims/new
  def new
    @trim = @model.trims.new
  end

  # GET /trims/1/edit
  def edit; end

  # POST /trims or /trims.json
  def create
    @trim = @model.trims.new(trim_params)

    respond_to do |format|
      if @trim.save
        format.html { redirect_to make_model_trims_url(@make, @model), notice: 'Trim was successfully created.' }
        format.json { render :show, status: :created, location: @trim }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trims/1 or /trims/1.json
  def update
    respond_to do |format|
      if @trim.update(trim_params)
        format.html { redirect_to make_model_trims_url(@make, @model), notice: 'Trim was successfully updated.' }
        format.json { render :show, status: :ok, location: @trim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trims/1 or /trims/1.json
  def destroy
    @trim.destroy
    respond_to do |format|
      format.html { redirect_to make_model_trims_url(@make, @model), notice: 'Trim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_make
    @make = Make.find(params[:make_id])
  end

  def set_model
    set_make
    @model = @make.models.find(params[:model_id])
  end

  def set_trim
    set_model
    @trim = @model.trims.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def trim_params
    params.require(:trim).permit(:models_id, :name)
  end
end
