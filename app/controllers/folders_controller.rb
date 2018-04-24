class FoldersController < ApplicationController
  before_action :authenticate_user!
  def view
    @myFolders = current_user.folders.all()
  end

  def add

    @new_folder = current_user.folders.new(user_params)
    if @new_folder.save
      respond_to do |format|
        format.html { redirect_to folders_view_url}
      end
    else
      render json: { status: 400, message: "Unsuccessfully created todo list.", }.to_json
    end

  end

  def update
  end

  def delete
  end

  def view_files
  end
  private
  def user_params
    params.permit(:name)
  end
end
