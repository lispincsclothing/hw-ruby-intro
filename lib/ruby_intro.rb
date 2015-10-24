# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  return arr.empty? ? 0 : arr.inject(:+)
end

def max_2_sum arr
  arr.empty? ? 0 : arr.sort.last(2).inject(:+)
end

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

def hello(name)
  "Hello, "+name
  
end

def starts_with_consonant? s
  !!(s[0] =~ /[^aeiou\W]/i)
end

def binary_multiple_of_4? s

  # s =~ /^[01]*1[01]*00$|[0]$/ 
  # above does not work for case 0 
  s =~ /^([048]|[0-9]*([02468][048]|[13579][26]))$/i #why work? 
end
  
# Part 3

class BookInStock
# YOUR CODE HERE
end
