class PagesController < ApplicationController
  def index
    @trips = Trip.all
  end
end
