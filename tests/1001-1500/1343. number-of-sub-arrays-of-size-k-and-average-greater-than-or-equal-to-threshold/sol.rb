# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} threshold
# @return {Integer}
def num_of_subarrays(arr, k, threshold)
    res = 0
    left = 0
    total = 0
    arr.each_with_index do |val, right|
        total += val
        if right - left + 1 == k
            res += 1 if total / k >= threshold
            total -= arr[left]
            left += 1
        end
    end
    res
end
