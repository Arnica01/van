class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  helper_method :search

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    if params[:destination]
      @schedules = @schedules.where('lower(destination) LIKE ?', "%#{params[:destination].downcase}%")
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end


  def search

    schedule = params[:destination]
    if params[:destination]
      @schedule = Schedule.where('lower(destination) LIKE ?', "%#{params[:destination].downcase}%")

    else
      @schedule = Schedule.all
    end

    @schedulelist = Schedule.select(:destination).distinct
    @schedule = Schedule.new
    render 'schedules/index'

  end

  # def self.search(destination)
  #   if destination
  #     where('name LIKE ?', "%#{destination}%")
  #   else
  #     all
  #   end
  # end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:destination, :time )
    end

  # def sort_column
  #   User.column_names.include?(params[:sort]) ? params[:sort] : "destination"
  # end
  #
  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "time"
  # end


end
