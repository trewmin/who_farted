class GroupsController < ApplicationController

  def index
    @current_user = User.find(session[:user_id])
    @groups = Group.all
  end

  def new
    @current_user = User.find(session[:user_id])
    @group = Group.new
  end

  def create
    @current_user = User.find(session[:user_id])
    @group = Group.new(group_params)
    @group.admin_id = @current_user.id
    if @group.valid?
      @group.save
      @current_user.groups << @group
      redirect_to group_path(@group)
    else
      flash[:error] = @group.errors.full_messages
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
    @current_user = User.find(session[:user_id])
    if @group.admin_id != @current_user.id
      redirect_to group_path(@group)
    end
  end

  def join
    @group = Group.find(params[:id])
    @current_user = User.find(session[:user_id])

    @current_user.groups << @group
    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find(params[:id])
    @current_user = User.find(session[:user_id])

    @current_user.groups.delete(@group)
    redirect_to users_groups_path(@current_user)
  end

  def update
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
    session[:group_id] = @group.id
    @current_user = User.find(session[:user_id])
  end

  def destory
  end

  def users_groups
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
    if @current_user == @user
      render "my_groups"
    else
      render "users_groups"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :desc)
  end

end
