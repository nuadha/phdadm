class PdfController < ApplicationController
  def show
    @progress = Progress.find(params[:progress_id])
    
    if (!@progress.nil?)
      send_data @progress.data, :type => @progress.content_type, :filename => @progress.name, :disposition => 'inline'
    else
      @user = current_user
      redirect_to user_path(@user)
    end
  end

  def download
  end
end
