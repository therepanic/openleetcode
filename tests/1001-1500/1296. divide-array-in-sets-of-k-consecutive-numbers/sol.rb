# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def is_possible_divide(nums, k)
    return false if nums.length % k != 0
    count = Hash.new(0)
    nums.each { |num| count[num] += 1 }
    nums.sort!
    nums.each do |num|
        next if count[num] == 0
        (0...k).each do |i|
            return false if count[num + i] == 0
            count[num + i] -= 1
        end
    end
    true
end
