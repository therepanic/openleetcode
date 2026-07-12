# @param {Integer[]} arr
# @return {Integer}
def peak_index_in_mountain_array(arr)
    l = 0
    r = arr.length - 1
    while l < r
        mid = (l + r) / 2
        if arr[mid] < arr[mid + 1]
            l = mid + 1
        else
            r = mid
        end
    end
    l
end
