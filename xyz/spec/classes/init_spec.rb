require 'spec_helper'
describe 'xyz' do
  context 'with default values for all parameters' do
    it { should contain_class('xyz') }
  end
end
