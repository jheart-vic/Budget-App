class BudgetsController < ApplicationController
  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @budget = Budget.where(user_id: @user.id, group_id: @group.id)
    @total = @budgets.sum(:amount)
  end

  def create
    @user = User.find(params[:user_id])
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    if @budget.valid?
      @budget.save
      # flash[:notice] = 'New group Created Successfully'
      redirect_to user_group_budgets_path
    else
      render :new
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    # flash[:notice] = 'Successfully removed the Recipe.'
    redirect_to user_group_budgets_path
  end

  private

  def budget_params
    params.require(:group_budget).permit!
  end
end
