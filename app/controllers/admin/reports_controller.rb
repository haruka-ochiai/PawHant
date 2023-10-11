class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.all.order(created_at: "DESC")
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    Report.find(params[:id]).update(report_params)
  end
  
  private

  def report_params
    params.require(:report).permit(:report_status) 
  end
end
