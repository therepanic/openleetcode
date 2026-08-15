# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def get_xor_sum(arr1, arr2)
    x, y = 0, 0
    arr1.each { |v| x ^= v }
    arr2.each { |v| y ^= v }
    x & y
end
