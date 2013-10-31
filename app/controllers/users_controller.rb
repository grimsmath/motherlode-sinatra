class UsersController < ApplicationController
  # POST /u
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /u/1
  def show
    # Ensure session belongs to user or is product admin
  end

  # PATCH/PUT /u/1
  def update
    # Ensure session belongs to user or is product admin
    respond_to do |format|
      if @user.update(user_params)
        format.json { head :no_content }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /u/1
  def destroy
    # Ensure session belongs to product admin
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = current_user
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :name, :email, :bio)
    end
end
