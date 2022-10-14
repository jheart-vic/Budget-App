class GroupsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @groups = @user.groups.order('created_at DESC')
      @budgets = Budget.all
    else
      render root_path
    end
  end

  def new
    @user = User.find(params[:user_id])
    @group = Group.new
  end

  def create
    @user = User.find(params[:user_id])
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.valid?
      @group.save
      flash[:notice] = 'New group Created Successfully'
      redirect_to user_groups_path
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = 'Group Successfully Removed .'
    redirect_to user_groups_path
  end

  private

  def group_params
    params.require(:group).permit!
  end

  # def set_group
  #   @group = Group.find(params[:id])
  # end
end
