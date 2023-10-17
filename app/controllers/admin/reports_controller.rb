class Admin::ReportsController < ApplicationController
  
  def index
    @reports = Report.order(created_at: "DESC").page(params[:page]).per(8)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
    redirect_to request.referer, notice: "ステータスを更新しました。"
    end
  end

  private

  def report_params
    params.require(:report).permit(:report_status, :reason, :content_id, :content_type)
  end
end
