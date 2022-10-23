require './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label, :publish_date

  def initialize(publish_date, publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    super(publish_date)
  end

  private

  def can_be_archieved?
    super || @cover_state == 'bad'
  end
end
