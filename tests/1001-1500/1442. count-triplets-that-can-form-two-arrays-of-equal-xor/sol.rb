# @param {Integer[]} arr
# @return {Integer}
def count_triplets(arr)
    total_count = 0
    prefix_xor = 0
    prefix_count = {0 => 1}
    index_sum = {0 => 0}
    arr.each_with_index do |value, i|
        k = i + 1
        prefix_xor ^= value
        if prefix_count.key?(prefix_xor)
            total_count += prefix_count[prefix_xor] * (k - 1) - index_sum[prefix_xor]
        else
            prefix_count[prefix_xor] = 0
            index_sum[prefix_xor] = 0
        end
        prefix_count[prefix_xor] += 1
        index_sum[prefix_xor] += k
    end
    total_count
end
