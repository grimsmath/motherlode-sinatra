class NuggetsController < ApplicationController
  # GET /n
  def index
    skip = nugget_params[:skip] || 0
    limit = nugget_params[:limit] || 20
    radius = nugget_params[:radius] || 1000
    longitude = nugget_params[:longitude] || 81.5097
    latitude = nugget_params[:latitude] || 30.2619
    coordinates = [longitude, latitude]

    near_nuggets = Nugget.all.geo_near(coordinates).spherical.where(geo_near_distance: radius)

    render json: near_nuggets
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
      params.permit(:title, :category_id, :category_slug, :author_id, :content, :longitude, :latitude, :radius)
    end
end
