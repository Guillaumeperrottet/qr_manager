class RedirectsController < ApplicationController
  def scan
    @qr_code = QrCode.find(params[:id])
    @qr_code.track_visit!

    redirect_to @qr_code.url
  end
end
