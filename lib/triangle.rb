require 'pry'
class Triangle
  # write code here
  attr_reader :side_one, :side_two, :side_three

  def initialize(size_one, side_two, side_three)
    @side_one = size_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    #@kind = if(@side_one <= 0 || @side_two <= 0 || @side_two <= 0 || 
   #           @side_one + @side_two < @side_three || @side_one + @side_three < @side_two || @side_two + @side_three < @side_one)
   #         raise TriangleError
   #         elsif(@side_one == @side_two && @side_one == @side_three)
   #           :equilateral 
   #         elsif(@side_one == @side_two || @side_one == @side_three || @side_two == @side_three)
   #           :isosceles
   #         else :scalene
   #         end
    validate_triangle
    if(@side_one == @side_two && @side_one == @side_three)
      :equilateral 
    elsif(@side_one == @side_two || @side_one == @side_three || @side_two == @side_three)
      :isosceles
    else 
      :scalene
    end
end

  def sides_greater_than_zero?
    [@side_one, @side_two, @side_three].all?(&:positive?)
  end

  def valid_triangle_inequality?
    @side_one + @side_two > @side_three && @side_one + @side_three > @side_two && @side_two + @side_three > @side_one
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

#binding.pry
