class HairstyleListsController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @hairstyle_list = HairstyleList.find params[:id]
  end

  def update
    @hairstyle_list = HairstyleList.find params[:id]
    style = @hairstyle_list.find_style(params[:style_id])

    if @hairstyle_list
      @hairstyle_list.styles = StylePosition.new(@hairstyle_list, style, params[:direction]).swap_position
      @hairstyle_list.save

      redirect_to root_path
    else
      render body: nil, status: 404
    end
  end
end
