# @param {Integer[]} arr
# @return {Boolean}
def valid_mountain_array(arr)
    n = arr.length
    i = 0
    
    while i+1 < n && arr[i] < arr[i+1]
        i += 1
    end
    
    if i == 0 || i == n-1
        return false
    end
    
    while i+1 < n && arr[i] > arr[i+1]
        i += 1
    end
    
    return i == n-1
end
