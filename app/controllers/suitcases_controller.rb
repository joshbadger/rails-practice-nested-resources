class SuitcasesController < ApplicationController
  before_action :set_passenger, except: :all_suitcases
  def index
    @suitcases = @passenger.suitcases
  end

  def show
    @suitcase = Suitcase.find(params[:id])
  end

  def new
    @suitcase = Suitcase.new
  end

  def create
    @suitcase = Suitcase.new(suitcase_params)
    @suitcase.passenger_id = @passenger.id
    if @suitcase.save
      redirect_to passenger_suitcase_path(@passenger, @suitcase)
    else
      render :new
    end
  end

  def edit
    @suitcase = Suitcase.find(params[:id])
  end

  def update
    @suitcase = Suitcase.find(params[:id])
    if @suitcase.update(suitcase_params)
      redirect_to passenger_suitcase_path(@passenger, @suitcase)
    else
      render :edit
    end
  end

  def destroy
    @suitcase = Suitcase.find(params[:id])
    @suitcase.destroy
    redirect_to passenger_suitcases_path
  end

  def all_suitcases
    @suitcases = Suitcase.all
  end

  private

  def suitcase_params
    params.require(:suitcase).permit(:description)
  end

  def set_passenger
    @passenger = Passenger.find(params[:passenger_id])
  end


end
