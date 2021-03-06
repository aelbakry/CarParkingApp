class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [ :create, :index]
  before_action :set_parking, only: [ :new, :create]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.user(@user.id)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new

  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # @user = User.find(params[:user_id])
    # parking = Parking.find(params[:parking_id])
    # @booking = @user.bookings.build(parking: parking, user: @user)
    @booking = @user.bookings.build(parking: @parking)
    @booking.update(booking_params)



    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_parking
      @parking = Parking.find(session[:parking_id])
    rescue ActiveRecord::RecordNotFound
      session[:parking_id] = params[:parking_id]
      @parking = Parking.find(session[:parking_id])

    end

    def set_booking
      @booking = Booking.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:belongs_to, :belongs_to, :date)
    end
end
