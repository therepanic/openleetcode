# @param {Integer[]} arr
# @return {Integer}
def sum_subarray_mins(arr)
    stack = []
    res = [0] * arr.length
    (0...arr.length).each do |i|
        while !stack.empty? && arr[stack.last] > arr[i]
            stack.pop
        end
        j = stack.empty? ? -1 : stack.last
        res[i] = res[j] + (i - j) * arr[i]
        stack.push(i)
    end
    res.sum % (10**9 + 7)
end
