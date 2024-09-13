class AnomaliesController < ApplicationController
  def index
    @anomalies = Anomaly.all
    render json: @anomalies
  end

  def show
    @anomaly = Anomaly.find(params[:id])
    render json: @anomaly
  end
end
