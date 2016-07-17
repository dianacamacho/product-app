require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#friendly_created_at' do 
    it 'should show created date as month day year' do
      order = Order.create
      friendly_date = order.friendly_created_at

      expect(order.created_at).to eq(friendly_date)
    end
  end

  describe '#friendly_created_at' do 
    it 'should show created date as month day year' do
      order = Order.create
      friendly_date = order.friendly_created_at

      expect(order.created_at).to eq(friendly_date)
    end
  end
  
end