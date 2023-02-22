require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it_behaves_like 'timestampable'
  it_behaves_like 'model with orders'

  describe '#name' do
    it { is_expected.to respond_to :name }
  end

  describe '#email' do
    it { is_expected.to respond_to :email }
  end

  describe '#cif' do
    it { is_expected.to respond_to :cif }
  end
end
