class LogsController < ApplicationController
  def index
    @logs = Log.all
    render json: @logs
  end

  def show
    @log = Log.find(params[:id])
    render json: @log
  end
end
