class HairstyleListsController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @hairstyle_list = HairstyleList.find params[:id]
  end
end
