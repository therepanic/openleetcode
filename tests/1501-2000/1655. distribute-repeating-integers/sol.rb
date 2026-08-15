# @param {Integer[]} nums
# @param {Integer[]} quantity
# @return {Boolean}
def can_distribute(nums, quantity)
  quantity.sort.reverse!
  freq_counts = Hash.new(0)
  nums.group_by(&:itself).transform_values(&:length).values.each { |f| freq_counts[f] += 1 }
  
  backtrack = lambda do |i|
    return true if i == quantity.length
    freq_counts.keys.each do |freq|
      count = freq_counts[freq]
      if freq >= quantity[i] && count > 0
        freq_counts[freq] -= 1
        freq_counts[freq - quantity[i]] += 1
        return true if backtrack.call(i + 1)
        freq_counts[freq] += 1
        freq_counts[freq - quantity[i]] -= 1
      end
    end
    false
  end
  
  backtrack.call(0)
end
