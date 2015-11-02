class SupportRequestsController < ApplicationController
  before_action :support_request_by_id, only: [:show, :edit, :update, :toggle_done, :destroy]

  def new
    @supreq = SupportRequest.new
  end

  def create
    @supreq = SupportRequest.new(support_request_params)
    if @supreq.save
      redirect_to support_request_path(@supreq), notice: "Don't worry, help is on the way!"
    else
      render :new
    end
  end

  def index
    page_num = params[:page] ? params[:page] : 1
    @supreqs = SupportRequest.order("done ASC").page page_num
  end

  def show
  end

  def search
    # TODO: refactor
    page_num = params[:page] ? params[:page] : 1
    @supreqs = SupportRequest.order("done ASC").search_for(params[:query]).page page_num
    render :index
  end

  def edit
  end

  def update
    if @supreq.update(support_request_params)
      redirect_to support_request_path(@supreq), notice: "Support request updated successfully."
    else
      render :edit
    end
  end

  def toggle_done
    @supreq.update(support_request_params)
    redirect_to support_requests_path, notice: "Request marked as #{@supreq.toggle_status_display}."
  end

  def destroy
    @supreq.destroy
    redirect_to support_requests_path, notice: "Support request deleted."
  end

  private

  def support_request_params
    params.require(:support_request).permit(:name, :email, :department, :message, :done)
  end

  def support_request_by_id
    @supreq = SupportRequest.find(params[:id])
  end
end
