require_relative 'spec_helper'

describe Item do
  it 'should be the instance object of Item class' do
    item = Item.new('12 December 2021')
    expect(item).to be_an_instance_of(Item)
  end
end
