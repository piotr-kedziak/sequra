require 'rails_helper'

RSpec.describe Shopper, type: :model do
  it_behaves_like 'timestampable'
  it_behaves_like 'model with orders'

  describe '#name' do
    it { is_expected.to respond_to :name }
  end

  describe '#email' do
    it { is_expected.to respond_to :email }
  end

  describe '#nif' do
    it { is_expected.to respond_to :nif }
  end
end
