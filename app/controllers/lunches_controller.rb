class LunchesController < ApplicationController
  before_action :set_lunch, only: [:show, :edit, :update, :destroy]

  def submit
    Lunch.destroy_all user: current_user

    data = params[:data]
    data.each_with_index do |row, row_index|
      row.each_with_index do |value, index|

        if value == 1
          date = Lunch.start_of_wdi + row_index.week + index
          Lunch.create lunch_date: date, user: current_user
        end
      end
    end
    render status: :created
  end

  def data
    user_lunches = Lunch.where user: current_user
    lunch_dates = user_lunches.pluck(:lunch_date)

    # Make a 13 by 5 grid of 0's
    data = 13.times.collect { 5.times.collect { 0 } }

    (0..12).each do |row_index|
      (0..4).each do |index|
        date = Lunch.start_of_wdi + row_index.week + index
        if lunch_dates.include? date
          data[row_index][index] = 1
        end
      end
    end

    render json: {weeks: data, lunch_count: user_lunches.count}
  end

  # GET /lunches
  # GET /lunches.json
  def index
    @lunches = Lunch.all
  end

  # GET /lunches/1
  # GET /lunches/1.json
  def show
  end

  # GET /lunches/new
  def new
    @lunch = Lunch.new
  end

  # GET /lunches/1/edit
  def edit
  end

  # POST /lunches
  # POST /lunches.json
  def create
    @lunch = Lunch.new(lunch_params)

    respond_to do |format|
      if @lunch.save
        format.html { redirect_to @lunch, notice: 'Lunch was successfully created.' }
        format.json { render :show, status: :created, location: @lunch }
      else
        format.html { render :new }
        format.json { render json: @lunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lunches/1
  # PATCH/PUT /lunches/1.json
  def update
    respond_to do |format|
      if @lunch.update(lunch_params)
        format.html { redirect_to @lunch, notice: 'Lunch was successfully updated.' }
        format.json { render :show, status: :ok, location: @lunch }
      else
        format.html { render :edit }
        format.json { render json: @lunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lunches/1
  # DELETE /lunches/1.json
  def destroy
    @lunch.destroy
    respond_to do |format|
      format.html { redirect_to lunches_url, notice: 'Lunch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lunch
      @lunch = Lunch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lunch_params
      params.require(:lunch).permit(:name, :location, :lunch_date)
    end
end
