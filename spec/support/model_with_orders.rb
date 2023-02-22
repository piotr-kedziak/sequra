shared_examples 'model with orders' do
  describe '#orders' do
    it { is_expected.to have_many(:orders).dependent(:nullify) }
  end
end
