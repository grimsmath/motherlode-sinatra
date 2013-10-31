class NuggetsController < ApplicationController
  #before_action :set_nugget, only: [:show, :edit, :update, :destroy]

  # GET /n
  def index
    # Add proper pagination and geolocation
    render json: Nugget.all.skip(params['skip'] || 0).limit(params['limit'] || 20).geo_near([params['lon'] || 33, params['lat'] || 33]).spherical
  end

  # GET /n/1
  def show
    if nugget =  Nugget.find(params[:id])
      render json: nugget
    else
      render json: nil, status: :not_found
    end
  end

  # POST /n
  def create
    nugget = Nugget.new nugget_params

    if nugget.save
      render json: nugget, status: :created, location: nugget
    else
      render json: nugget.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /n/1
  def update
    nugget = Nugget.find(params[:id])

    if nugget.update nugget_params
      render json: nugget
    else
      render json: nugget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /n/1
  def destroy
    nugget = Nugget.find(params[:id])

    if nugget.destroy
      render json: nil
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def nugget_params
      params.permit(:title, :category_id, :author_id, :content)
    end
end
