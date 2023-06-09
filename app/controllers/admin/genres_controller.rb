class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find{}
    @genres = Genre.all
    @genre = Genre.new
    genre = Genre.new(genre_params)
  end

  def create
   genre = Genre.new(genre_params)
   genre.save
   redirect_to admin_genres_path
  end

   def update
    @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:success] = "編集に成功しました"
     else
      flash[:danger] = "編集に失敗しました"
      render :edit
     end

   end

  private
  def genre_params
    params.permit(:name, :genre_id, :is_active)
  end
end
