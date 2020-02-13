class ImageController < ApplicationController

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to :back
  end


end
