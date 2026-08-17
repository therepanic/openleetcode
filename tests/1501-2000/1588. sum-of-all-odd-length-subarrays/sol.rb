# @param {Integer[]} arr
# @return {Integer}
def sum_odd_length_subarrays(arr)
    s = arr.sum
    l = arr.length - 1
    i = 2
    while l >= i
        j = 0
        e = i
        while e <= l
            s += arr[j..e].sum
            j += 1
            e += 1
        end
        i += 2
    end
    s
end
