class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end
  def show
    @list = List.find(params[:id])
    @average_ratings = @list.bookmarks.group(:movie_id).average(:rating).transform_values { |avg| avg.to_f.round(2) }
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end
  private
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
