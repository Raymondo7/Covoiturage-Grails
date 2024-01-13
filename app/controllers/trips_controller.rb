class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :reserve]

  def index
    @trips = Trip.all
    # À noter : Il semble y avoir une redondance ici, vérifiez si vous avez besoin des deux lignes suivantes.
    render ('pages/index')
    @trips = Trip.search(params[:origine], params[:destination])
  end

  def show
    @trip = Trip.find(params[:id])
    @reservation = Reservation.new
    @comment = Comment.new
  end

  def search
    @trips = Trip.order(created_at: :desc)
    @search_path = recherche_trips_path
    render ('trips/recherche')
  end

  def recherche
    if params[:origine].present? || params[:destination].present?
      if params[:origine].present? && params[:destination].present?
        @trips = Trip.search(params[:origine], params[:destination])
      elsif params[:origine].present?
        @trips = Trip.search(params[:origine], nil)
      elsif params[:destination].present?
        @trips = Trip.search(nil, params[:destination])
      end
      render :recherche
    else
      redirect_to trips_path, alert: "Veuillez fournir au moins une origine ou une destination pour la recherche."
    end
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def reserve
    @reservation = current_user.reservations.build(trip: @trip, seats: params[:seats])

    if @reservation.save
      redirect_to @trip, notice: 'Places réservées avec succès!'
    else
      render 'show'
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Le trajet a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Le trajet a été supprimé avec succès.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    # Modifiez cette ligne pour refléter la structure de vos paramètres.
    params.require(:trip).permit(:origine, :destination, :date_trip, :heure, :cout, :place, :type_car, :duree).merge(user_id: current_user.id)
  end
end
