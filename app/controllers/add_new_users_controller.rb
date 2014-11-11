class AddNewUsersController < ApplicationController
  before_action :set_add_new_user, only: [:show, :edit, :update, :destroy]

  # GET /add_new_users
  # GET /add_new_users.json
  def index
    @add_new_users = AddNewUser.all
  end

  # GET /add_new_users/1
  # GET /add_new_users/1.json
  def show
  end

  # GET /add_new_users/new
  def new
    @add_new_user = AddNewUser.new
  end

  # GET /add_new_users/1/edit
  def edit
  end

  # POST /add_new_users
  # POST /add_new_users.json
  def create
    @add_new_user = AddNewUser.new(add_new_user_params)

    respond_to do |format|
      if @add_new_user.save
        format.html { redirect_to @add_new_user, notice: 'Add new user was successfully created.' }
        format.json { render :show, status: :created, location: @add_new_user }
      else
        format.html { render :new }
        format.json { render json: @add_new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_new_users/1
  # PATCH/PUT /add_new_users/1.json
  def update
    respond_to do |format|
      if @add_new_user.update(add_new_user_params)
        format.html { redirect_to @add_new_user, notice: 'Add new user was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_new_user }
      else
        format.html { render :edit }
        format.json { render json: @add_new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_new_users/1
  # DELETE /add_new_users/1.json
  def destroy
    @add_new_user.destroy
    respond_to do |format|
      format.html { redirect_to add_new_users_url, notice: 'Add new user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_new_user
      @add_new_user = AddNewUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_new_user_params
      params.require(:add_new_user).permit(:name, :age)
    end
end
