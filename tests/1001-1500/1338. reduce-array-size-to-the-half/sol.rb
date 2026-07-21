# @param {Integer[]} arr
# @return {Integer}
def min_set_size(arr)
  freq = Hash.new(0)
  arr.each { |num| freq[num] += 1 }
  
  counts = freq.values.sort.reverse
  
  sum_removed = 0
  min_set_size = 0
  counts.each do |count|
    sum_removed += count
    min_set_size += 1
    return min_set_size if sum_removed >= arr.length / 2
  end
  min_set_size
end
