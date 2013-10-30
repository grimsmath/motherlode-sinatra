class NuggetsController < ApplicationController
  before_action :set_nugget, only: [:show, :edit, :update, :destroy]

  # GET /n
  def index
    # Add proper pagination
    @nuggets = Nugget.all.skip(params['skip'] || 0).limit(params['limit'] || 20)
  end

  # GET /n/1
  def show
  end

  # POST /n
  def create
    @nugget = Nugget.new(nugget_params)

    respond_to do |format|
      if @nugget.save
        format.json { render action: 'show', status: :created, location: @nugget }
      else
        format.json { render json: @nugget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /n/1
  def update
    respond_to do |format|
      if @nugget.update(nugget_params)
        format.json { head :no_content }
      else
        format.json { render json: @nugget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /n/1
  def destroy
    @nugget.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nugget
      @nugget = Nugget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nugget_params
      params.require(:nugget).permit(:title, :category_id, :author_id, :content)
    end
end
