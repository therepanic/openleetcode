# @param {Integer[]} arr
# @return {Integer[][]}
def minimum_abs_difference(arr)
    arr.sort!
    min_diff = (1...arr.length).map { |i| arr[i] - arr[i-1] }.min
    result = []
    (1...arr.length).each do |i|
        result << [arr[i-1], arr[i]] if arr[i] - arr[i-1] == min_diff
    end
    result
end
