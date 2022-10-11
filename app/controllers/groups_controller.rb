class GroupsController < ApplicationController
  def index
    @user = User.find(params[user_id])
    @groups = Group.icludes(:user).where(user_id: @user.id)
    @group_budgets = GroupBudget.includes(:user).where(group_id: @groups.ids)
  end

  def show
    @group_budgets = GroupBudget.includes(:user).where(group_id: @groups.ids)
  end

  def new
    @user = User.find(params[user_id])
    @group = Group.new
  end

  def create
    @user = User.find(params[user_id])
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.valid?
      @group.save
      # flash[:notice] = 'New group Created Successfully'
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    # flash[:notice] = 'Successfully removed the Recipe.'
    redirect_to groups_path
  end

  private

  def group_params
    param.require(:group).permit!
  end
end
