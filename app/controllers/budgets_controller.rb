class BudgetsController < ApplicationController
  before_action :set_group
  def index
    @user = current_user
    # @group = Group.find(params[:group_id])
    @budgets = @group.budgets
    @total = @budgets.sum(:amount)
  end

  def new
    @budget = Budget.new
    # @group = Group.all
  end

  def create
    @user = User.find(params[:user_id])
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    if @budget.valid?
      @budget.save
      @budget.groups.push(@group)
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
    params.require(:budget).permit(:name, :amount)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
