# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(nums, k)
    return 0 if k < 0
    count = 0
    num_counts = Hash.new(0)
    nums.each { |num| num_counts[num] += 1 }
    num_counts.each do |num, freq|
        if k == 0
            count += 1 if freq >= 2
        else
            count += 1 if num_counts.key?(num + k)
        end
    end
    count
end
