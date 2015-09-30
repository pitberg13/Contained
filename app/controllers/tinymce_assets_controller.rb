class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:image]
    image    = Image.create params.permit(:image, :alt, :hint)

    render json: {
      image: {
        url:    image.file.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
end
