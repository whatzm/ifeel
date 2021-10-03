# frozen_string_literal: true

class Bucket
  PRICE = { 'potato' => 10, 'carrot' => 20, 'tomato' => 30 }.freeze

  attr_accessor :vegetable

  def initialize
    @vegetable = []
  end

  def add_item(vegetable)
    if PRICE.key?(vegetable)
      @vegetable << vegetable
    else
      puts 'Error! You can add only: potato, carrot or tomato!'
    end
  end

  def +(other)
    @vegetable.concat(other.vegetable)
    other.vegetable.clear
    self
  end

  def total_sum
    PRICE.values_at(*@vegetable).sum
  end
end
