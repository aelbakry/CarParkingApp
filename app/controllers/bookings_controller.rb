class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [ :create, :index]
  before_action :set_parking, only: [ :show, :edit, :update, :destroy]


  # Index method responsible for displaying bookings related to the current user
  # GET /bookings
  def index
    @bookings = Booking.user(@user.id)
  end

  # Show method responsible for displaying the booking selelcted
  # GET /bookings/1
  def show
  end

  # New method responsbile for creating a new booking obect
  # and setting the session for this booking
  # GET /bookings/new
  def new
    @booking = Booking.new
    session[:booking_id] = params[:booking_id]
    @parking = Parking.find(session[:parking_id])
  end

  # New method responsbile for editing a booking obect
  # GET /bookings/1/edit
  def edit
  end

  # Create method responsbile to create a new booking absed on associations
  # with user and parking objects, accomplished through build.
  # The method redirects the user according to the failure or success of creation.
  # POST /bookings
  def create

    @parking = Parking.find(session[:parking_id])
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

  # Update method responsible for updating the related booking and redirecting the user to
  # the correct path based on success or failure.
  # PATCH/PUT /bookings/1
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

  # Delete method responsible for destroying a booking from database.
  # DELETE /bookings/1
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
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allowing required parameters to be passed
    def booking_params
      params.require(:booking).permit(:belongs_to, :belongs_to, :date)
    end
end
