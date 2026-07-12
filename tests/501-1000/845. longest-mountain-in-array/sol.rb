# @param {Integer[]} arr
# @return {Integer}
def longest_mountain(arr)
    n = arr.length
    best = 0
    i = 1
    
    while i < n - 1
        if arr[i - 1] < arr[i] && arr[i] > arr[i + 1]
            left = i - 1
            right = i + 1
            while left > 0 && arr[left - 1] < arr[left]
                left -= 1
            end
            while right < n - 1 && arr[right] > arr[right + 1]
                right += 1
            end
            best = [best, right - left + 1].max
            i = right
        end
        i += 1
    end
    
    best
end
