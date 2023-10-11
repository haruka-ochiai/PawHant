class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.all.order(created_at: "DESC").page(params[:page]).per(8)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    Report.find(params[:id]).update(report_params)
    redirect_to admin_reports_path, notice: "ステータスを更新しました。"
  end

  private

  def report_params
    params.require(:report).permit(:report_status)
  end
end
