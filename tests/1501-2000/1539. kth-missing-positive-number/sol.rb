def find_kth_positive(arr, k)
    low, high = 0, arr.length - 1
    while low <= high
        mid = (low + high) / 2
        missing = arr[mid] - (mid + 1)
        if missing < k
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return high + 1 + k
end
