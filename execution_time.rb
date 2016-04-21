def my_min(array)
  array.each_with_index do |el1, idx1|
    array.each_with_index do |el2, idx2|
      next if idx1 == idx2
      break if el1 > el2
    end
    return el1
  end

end

def my_min_2(array)
  smallest_value = array[0]

  array.each do |el|
    smallest_value = el if el < smallest_value
  end
  smallest_value
end

def largest_sub_sum(array)
  sub_arrays = []

  start_idx = 0
  while start_idx < array.length
    end_idx = start_idx
    while end_idx < array.length
      sub_arrays << array[start_idx..end_idx]

      end_idx += 1
    end

    start_idx += 1
  end
  largest_sum = 0

  sub_arrays.each do |sub_array|
    sub_array_sum = 0
    sub_array.each do |el|
      sub_array_sum += el
    end
    largest_sum = sub_array_sum if sub_array_sum > largest_sum
  end

  largest_sum
end

def largest_sub_sum_2(array)
  largest_sum = 0
  sub_sum = array[0]

  if sub_sum > largest_sum
    largest_sum = sub_sum
  end

  idx = 0
  while idx < array.length - 1
    if array[idx + 1] + sub_sum > sub_sum
      sub_sum += array[idx + 1]

      if sub_sum > largest_sum
        largest_sum = sub_sum
      end
    else
      sub_sum = array[idx + 1]
    end

    idx += 1
  end

  largest_sum
end

def largest_sub_sum_3(array)
  largest_sum = 0
  subsum = 0

  idx = 0
  while idx < array.length
    if array[idx] > subsum + array[idx]
      subsum = array[idx]
    else
      subsum += array[idx]
    end

    if subsum > largest_sum
      largest_sum = subsum
    end

    idx += 1
  end

  largest_sum
end

def first_anagram(word1, word2)
  chars = word1.chars
  anagrams = chars.permutation.to_a
  anagrams.map { |array| array.join }.include?(word2)
end

def second_anagram(word1, word2)
  return false if word1.length != word2.length
  chars1 = word1.chars
  chars2 = word2.chars
  chars1.each do |char|
    chars2.delete(char)
  end
  chars2.empty?
end

def third_anagram(word1, word2)
  word1 = word1.chars.sort.join
  word2 = word2.chars.sort.join
  word1 == word2

end

def fourth_anagram(word1, word2)
  hash = Hash.new(0)

  word1.each_char do |letter|
    hash[letter] += 1
  end

  word2.each_char do |letter|
    hash[letter] -= 1
  end

  hash.all? { |key, val| val == 0 }

end

def bad_two_sum?(array, target)
  array.each_with_index do |el, idx|
    array[(idx + 1)..-1].each do |el2|
      return true if el + el2 == target
    end
  end
  false
end
# n squared

def okay_two_sum?(array, target)
  sorted_array = array.sort
  sorted_array.each_with_index do |element, index|
    if bsearch(array[index + 1..-1], target - element)
      return true
    else
      next
    end
  end

  false
end
# n log(n)

def bsearch(array, target)
  return false if array.length == 0
  middle_index = array.length / 2
  return true if target == array[middle_index]
  if target < array[middle_index]
    bsearch(array[0...middle_index], target)
  else
    bsearch(array[middle_index + 1..-1], target)
  end
end

def good_two_sum(array, target)
  hash = Hash.new(0)

  array.each do |el|
    hash[el] += 1
    if target - el == el
      return true if hash[target - el] == 2
    else
      return true if hash[target - el] == 1
    end
  end

  false
end

def good_two_sum2(array, target)
  hash = Hash.new(0)

  array.each do |el|
    return true if hash[target - el] > 0
    hash[el] += 1
  end

  false
end

def windowed_max_range(array, w)
  largest_value = 0

  array[0..-w].each_with_index do |el, idx|
    sorted_sub_array = array.slice(el, w).sort
    value = sorted_sub_array[-1] - sorted_sub_array[0]
    if value > largest_value
      largest_value = value
    end
  end
  largest_value
end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
end


class StackQueue
  def initialize
    @store = MyStack.new
  end

  def enqueue(el)
      @store.push
  end

  def dequeue
    temp_stack = MyStack.new

    until @store.empty?
      temp_stack.push(@store.pop)
    end

    result = temp_stack.pop

    until temp_stack.empty?
      @store.push(temp_stack.pop)
    end

    result
  end

end
