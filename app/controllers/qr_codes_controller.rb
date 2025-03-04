lass QrCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_qr_code, only: [:show, :edit, :update, :destroy, :scan]

  def index
    @qr_codes = current_user.qr_codes.order(created_at: :desc)
  end

  def show
    @qr_data_url = QrCodeGenerator.new(redirect_qr_code_url(@qr_code)).as_data_url
  end

  def new
    @qr_code = current_user.qr_codes.new
  end

  def create
    @qr_code = current_user.qr_codes.new(qr_code_params)

    if @qr_code.save
      redirect_to qr_codes_path, notice: 'QR code was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @qr_code.update(qr_code_params)
      redirect_to qr_codes_path, notice: 'QR code was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @qr_code.destroy
    redirect_to qr_codes_path, notice: 'QR code was successfully deleted.'
  end

  def scan
    @qr_code.track_visit!
    redirect_to @qr_code.url
  end

  private

  def set_qr_code
    @qr_code = current_user.qr_codes.find(params[:id])
  end

  def qr_code_params
    params.require(:qr_code).permit(:title, :url, :description, :active)
  end
end
