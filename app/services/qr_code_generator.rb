require 'rqrcode'

class QrCodeGenerator
  attr_reader :url, :size

  def initialize(url, size: 300)
    @url = url
    @size = size
  end

  def generate
    qrcode = RQRCode::QRCode.new(@url)
    qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: @size,
      resize_gte_to: false,
      size: @size
    )
  end

  def as_data_url
    png = generate
    data = Base64.strict_encode64(png.to_s)
    "data:image/png;base64,#{data}"
  end

  def save_to_file(path)
    png = generate
    png.save(path)
  end
end
