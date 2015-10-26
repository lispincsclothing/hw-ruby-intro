# When done, submit this entire file to the autograder.

# Part 1
# 0. Define a method `sum(array)` that takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.
def sum arr
  return arr.empty? ? 0 : arr.inject(:+)
end

# 0. Define a method `max_2_sum(array)` which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.
def max_2_sum arr
  arr.empty? ? 0 : arr.sort.last(2).inject(:+)
end

# 0. Define a method `sum_to_n?(array)` that takes an array of integers and an additional integer, n, as arguments and returns true if any two elements in the array of integers sum to n. An empty array should sum to zero by definition.
def sum_to_n?(arr, n)
  # return false if arr.empty? - taken care of by spaceship operator et al
  left = 0
  right = arr.length - 1
  arr.sort!
  while left < right
    case arr[left] + arr[right] <=> n
    when 0
      return true
    when 1
      right -= 1
    when -1
      left += 1
    end
  end
  false
end

# Part 2
# 0. Define a method `hello(name)` that takes a string representing a name and returns the string "Hello, " concatenated with the name.
def hello(name)
  "Hello, #{name}"
end

# 0. Define a method `starts_with_consonant?(s)` that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant? s
  !!(s[0] =~ /[^aeiou\W]/i)
end

# 0. Define a method `binary_multiple_of_4?(s)` that takes a string and returns true if the string represents a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4? s
  s =~ /^([01]*0)?0$/
end

# Part 3
# Define a class `BookInStock` which represents a book with an ISBN
# number, `isbn`, and price of the book as a floating-point number,
# `price`, as attributes.
#
# The constructor should accept the ISBN number
# (a string, since in real life ISBN numbers can begin with zero and can
# include hyphens) as the first argument and price as second argument, and
# should raise `ArgumentError` (one of Ruby's built-in exception types) if
# the ISBN number is the empty string or if the price is less than or
# equal to zero.  Include the proper getters and setters for these
# attributes.
#
# Include a method `price_as_string` that returns the price of
# the book formatted with a leading dollar sign and two decimal places, that is, a price
# of 20 should format as "$20.00" and a price of 33.8 should format as
# "$33.80".
class BookInStock
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    raise ArgumentError.new "ISBN must be non-empty string" unless
      isbn.is_a?(String) && !isbn.empty?
    raise ArgumentError.new "Price must be greather than 0" unless price > 0
    @isbn, @price  = isbn, price
  end

  def price_as_string
    %Q{$#{"%.2f" % @price}}
  end
end
