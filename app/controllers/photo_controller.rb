class PhotoController < ApplicationController
	before_action :authenticate_user!
  def view
		@myphotos = current_user.photos.all()
  end

  def add
		@new_photo = current_user.photos.new(user_params)
		if @new_photo.save
			respond_to do |format|
				format.html { redirect_to photo_view_url}
			end
		else
			render json: { status: 400, message: "Unsuccessfully created todo list.", }.to_json
		end
  end

  def update
  end

  def delete
  end
  private
	def user_params
		params.permit(:name, :image)
	end
end
