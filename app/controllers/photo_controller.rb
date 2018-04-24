class PhotoController < ApplicationController
	before_action :authenticate_user!
	def view
		if params[:id]!=nil
			@current_folder = params[:id]
			@myphotos = current_user.photos.where(folder_id: params[:id])
		else
			format.html { redirect_to root_url}
		end
	end

	def add
		@new_photo = current_user.photos.new(user_params)
		if @new_photo.save
			respond_to do |format|
				photo_uri = '/files/view/'+user_params[:folder_id]
				format.html { redirect_to photo_uri}
			end
		else
			render json: { status: 400, message: "Unsuccessfully created todo list.", }.to_json
		end
	end

	def update
	end

	def delete
	end

	def view_all
		# redirect_to url_for(:controller => :folders, :action => :view)
	end

	private
	def user_params
		params.permit(:name, :image, :folder_id)
	end
end
