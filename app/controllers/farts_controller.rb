class FartsController < ApplicationController

  def create

    @fart = Fart.new

    @current_user = User.find(session[:user_id])
    @current_group = Group.find(session[:group_id])

    @fart.smelter = @current_user
    @fart.group = @current_group

    @fart.save

    redirect_to group_path(@current_group)
  end

  def regret
    @fart = Fart.find(params[:id])
    @fart.destroy
    @current_group = Group.find(session[:group_id])
    redirect_to group_path(@current_group)
  end

  def guilty
    @current_user = User.find(session[:user_id])
    @current_group = Group.find(session[:group_id])
    @fart = @current_group.farts.last
    @fart.delter_id = @current_user.id
    @fart.save
    redirect_to group_path(@current_group)
  end

end
