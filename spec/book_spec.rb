require_relative './spec_helper'

describe Book do
  before(:each) do
    @book = Book.new('publish_date', 'publisher', 'cover_state')
  end

  it 'should be the instance object of Book class' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Should return publisher' do
    expect(@book.publisher).to eq 'publisher'
  end
end
