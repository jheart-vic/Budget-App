class GroupBudgetsController < ApplicationController
  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @group_budget = GroupBudget.where(user_id: @user.id, group_id: @group.id)
    @total = @group_budgets.sum(:amount)
  end

  def create
    @user = User.find(params[user_id])
    @group_budget = GroupBudget.new(group_budget_params)
    @group_budget.user_id = current_user.id
    if @group_budget.valid?
      @group_budget.save
      # flash[:notice] = 'New group Created Successfully'
      redirect_to user_group_budgets_path
    else
      render :new
    end
  end

  def destroy
    @group_budget = GroupBudget.find(params[:id])
    @group_budget.destroy
    # flash[:notice] = 'Successfully removed the Recipe.'
    redirect_to user_group_budgets_path
  end

  private

  def group_budget_params
    param.require(:group_budget).permit!
  end
end
