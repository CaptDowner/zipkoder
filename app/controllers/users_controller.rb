class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
# before_action :require_correct_user, only: [:edit, :update, :destroy ]

# before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
# def index
#   @users = User.all
# end
  def index
    if current_user_admin?
      @users = User.all
    else
      redirect_to zips_path, alert: 'Access to user information is restricted to admins!'
    end
  end


  def show
    if current_user || current_user_admin?
      @user = User.find(params[:id])
    else
      redirect_to zips_path, notice: "Login required to access your user page!"
    end
  end



  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Update successful!"
    else
      render :edit
    end
  end
=begin
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    name = "#{@user.firstname} #{@user.lastname}"
    @user.destroy
    session[:user_id] = nil
    redirect_to new_session_path, alert: "#{name} was successfully deleted!"
=begin
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
=end
  end

  private

  def require_correct_user
    unless current_user || current_user_admin?
      redirect_to new_user_path
    end
  end

  def sort_column
    params[:sort] || "lastname"
  end

  def sort_direction
     params[:direction] || "asc"
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
