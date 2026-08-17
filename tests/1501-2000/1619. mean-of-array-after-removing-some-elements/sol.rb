# @param {Integer[]} arr
# @return {Float}
def trim_mean(arr)
    n = arr.length
    per5 = (0.05 * n).to_i
    arr.sort!
    arr = arr[per5...n-per5]
    arr.sum.to_f / (n - per5 - per5)
end
