class GroupsController < ApplicationController
  before_action :set_group, only: %i[destroy]
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
    puts group_params
    @user = User.find(params[:user_id])
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.valid?
      @group.save
      flash[:notice] = 'New group Created Successfully'
      redirect_to user_groups_path
    else
      flash[:notice] = 'Input a valid Icon image and Name.'
      render :new
    end
  end

  def destroy
    @group.budgets.each(&:destroy)
    @group.destroy
    respond_to do |format|
      format.html { redirect_to user_groups_path, notice: 'Group has been successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def group_params
    params.require(:group).permit!
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
