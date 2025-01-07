## Part 1

def sum(arr)
  arr.sum
end

def max_2_sum(arr)
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  arr.max(2).sum
end

def sum_to_n?(arr, n)
  return false if arr.empty?
  complements = {}
  arr.each do |num|
    return true if complements[num]
    complements[n - num] = true
  end
  false
end

# Part 2

def hello(name)
  "Hello, #{name}!"
end

def starts_with_consonant?(s)
  return false if s.empty?
  !!(s[0] =~ /\A(?=[^aeiou])(?=[a-z])/i)
end

def binary_multiple_of_4?(s)
  return false unless s =~ /\A[01]+\z/
  s.to_i(2) % 4 == 0
end

# Part 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError, 'ISBN cannot be empty' if isbn.empty?
    raise ArgumentError, 'Price must be greater than 0' if price <= 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    format('$%.2f', @price)
  end
end


# Test cases for Part 1
puts "Part 1 Tests"
puts "Sum: #{sum([1, 2, 3])}" # => 6
puts "Max 2 Sum: #{max_2_sum([1, 2, 3])}" # => 5
puts "Sum to n?: #{sum_to_n?([1, 2, 3], 5)}" # => true

# Test cases for Part 2
puts "\nPart 2 Tests"
puts hello("Alice") # => "Hello, Alice!"
puts starts_with_consonant?("Ruby") # => true
puts starts_with_consonant?("apple") # => false
puts binary_multiple_of_4?("100") # => true
puts binary_multiple_of_4?("101") # => false

# Test cases for Part 3
puts "\nPart 3 Tests"
book = BookInStock.new("12345", 29.95)
puts "Book ISBN: #{book.isbn}" # => "12345"
puts "Book Price: #{book.price}" # => 29.95
puts "Price as String: #{book.price_as_string}" # => "$29.95"
