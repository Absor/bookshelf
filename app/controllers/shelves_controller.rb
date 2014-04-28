class ShelvesController < ApplicationController

  def index
    @shelves = Shelf.includes(:books).order('created_at DESC').where(user_id: current_user.id)
    authorize @shelves

    render json: @shelves.to_json(include: :books)
  end

  def show
    @shelf = Shelf.includes(:books).find(params[:id])
    authorize @shelf

    render json: @shelf.to_json(include: :books)
  end

  def create
    @shelf = Shelf.new(params[:shelf])
    @shelf.user = current_user
    authorize @shelf

    if @shelf.save
      render json: @shelf, status: :created, location: bookshelf_url(@shelf)
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
  end

  def update
    @shelf = Shelf.find(params[:id])
    authorize @shelf

    if @shelf.update(params[:shelf])
      head :no_content
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    authorize @shelf

    @shelf.destroy

    head :no_content
  end
end