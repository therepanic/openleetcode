# @param {String[]} nums
# @return {String}
def find_different_binary_string(nums)
    nums.each_with_index.map { |x, i| x[i] == '0' ? '1' : '0' }.join
end
