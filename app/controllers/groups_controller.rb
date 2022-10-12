class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  # before_action :set_group
  def index
    @user = User.find(params[:user_id])
    @groups = @user.groups
    # @budgets = Budget.includes(:user).where(group_id: @groups.ids)
    # @groups = Group.includes(:user).where(user_id: @user.id)
    @budgets = Budget.all
    # @budget = Budget.joins(@groups).where(group_id: @groups.ids)
  end

  def show
    # @group = Group.find(params[:id])
    @budgets = @group.budgets
    # @budgets = Budget.includes(:user).where(group_id: @group.id)
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
      # flash[:notice] = 'New group Created Successfully'
      redirect_to user_groups_path
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
    params.require(:group).permit!
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
