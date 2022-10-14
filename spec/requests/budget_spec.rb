require 'rails_helper'

RSpec.describe 'Budgets', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Dan Go', password: '123456', email: 'dan@gmail.com', confirmed_at: Time.now)
    @group = @user.groups.create(name: 'Car', icon: 'https://icon.com/icon.jpg')
    @budget = @group.budgets.create(name: 'Toyota', amount: 100)
    sign_in @user
  end

  context 'GET /index : ' do
    before(:example) { get user_group_budgets_path(@user, @group) }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      expect(assigns(:budgets)).to eq(Budget.all)
    end
  end
end
