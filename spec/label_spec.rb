require_relative './spec_helper'

describe Label do
  before(:each) do
    @label = Label.new('title', 'color')
  end

  it 'should be the instance object of Label class' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'Should return title' do
    expect(@label.title).to eq 'title'
  end
end
