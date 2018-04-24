class FoldersController < ApplicationController
  before_action :authenticate_user!
  def view
    @myFolders = current_user.folders.all()
  end

  def add
    if current_user.folders.find_by(:name => user_params[:name]).present?

      flash[:alert] = "A folder with that name already exists!"
      respond_to do |format|
        format.html { redirect_to folders_view_url}
      end
    else
      @new_folder = current_user.folders.new(user_params)
      if @new_folder.save
        respond_to do |format|
          format.html { redirect_to folders_view_url}
        end
      else
        format.html { redirect_to folders_view_url, notice: 'Folder withthat name already exists.' }
      end
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
