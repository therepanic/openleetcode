# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    freq = Hash.new(0)
    nums.each do |i|
        freq[i] += 1
    end
    freq.sort_by { |key, value| -value }.map { |key, value| key }.first(k)
end
