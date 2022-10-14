require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Chris', password: '123456', email: 'chris@gmail.com', confirmed_at: Time.now)
    @group = @user.groups.create(name: 'Toyota', icon: 'https://icon.com')
    sign_in @user
  end

  context 'GET /index : ' do
    it 'returns http success' do
      get user_groups_path(@user)
      expect(response).to have_http_status(:success)
    end
  end
end
