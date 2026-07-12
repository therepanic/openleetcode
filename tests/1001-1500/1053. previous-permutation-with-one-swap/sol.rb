# @param {Integer[]} arr
# @return {Integer[]}
def prev_perm_opt1(arr)
    n = arr.length
    i = n - 2
    while i >= 0 && arr[i] <= arr[i + 1]
        i -= 1
    end
    return arr if i < 0

    j = n - 1
    while arr[j] >= arr[i] || (j > i + 1 && arr[j] == arr[j - 1])
        j -= 1
    end

    arr[i], arr[j] = arr[j], arr[i]
    arr
end
