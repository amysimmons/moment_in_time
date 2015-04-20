class MomentsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroys
  end

  private
  def moment_params
      params.require(:moment).permit(:post_author, :post_content, :post_image, :post_time, :post_date, :post_location, :post_url, :post_medium)
  end

end
