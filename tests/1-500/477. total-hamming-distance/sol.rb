# @param {Integer[]} nums
# @return {Integer}
def total_hamming_distance(nums)
    nums.map { |num| num.to_s(2).rjust(32, '0') }.map(&:chars).transpose.sum { |bits| ones = bits.count('1'); zeros = bits.count('0'); ones * zeros }
end
