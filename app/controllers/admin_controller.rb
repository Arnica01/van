class AdminController < ApplicationController


  def schedules
    @schedule = Schedules.all
  end
  def dashboard
    @users = User.all
  end

  def ban
    @user = User.find(params[:id])
    @user[:is_ban] = true
    @user.save
  end

  def permit
    @user = User.find(params[:id])
    @user[:is_ban] = false
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/admin/dashboard', notice: 'User was successfully permitted.' }
        format.json { head :no_content }
      end

    end
  end




end
