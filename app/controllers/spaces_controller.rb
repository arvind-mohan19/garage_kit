class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :update, :destroy]

  # GET /spaces
  # GET /spaces.json
  def index
    slots = Slot.all
    appointments = Appointments.where("(from_timestamp < #{DateTime.now} and to_timestamp > #{DateTime.now + params[:required_hours].hours}) or 
                    (from_timestamp >= #{DateTime.now} and from_timestamp <= #{DateTime.now + params[:required_hours].hours}")  
    @spaces =  Space.find_by_sql('SELECT *, ( 6371 * acos( cos( radians(" . #{params[:latitude]} . ") ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(" . #{params[:longitude]} . ") ) + sin( radians(" . #{params[:latitude]} . ") ) * sin( radians( latitude ) ) ) ) AS distance FROM spaces where available = true and HAVING distance < 5')
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(params[:space])
    slot = Slot.new(params[:slot])
    if @space.save and slot.save
      render :show, status: :created, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update
    if @space.update(space_params)
      render :show, status: :ok, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.fetch(:space, {})
    end
end
