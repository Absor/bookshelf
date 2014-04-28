require 'spec_helper'

describe 'Signing in', js: true do

  before :each do
    visit '/'
    click_link 'Sign in'
  end

  it 'should allow login' do
  end
end