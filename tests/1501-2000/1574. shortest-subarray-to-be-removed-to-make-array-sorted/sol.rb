# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
    n = arr.length
    right = n - 1
    while right > 0 && arr[right - 1] <= arr[right]
        right -= 1
    end
    return 0 if right == 0
    answer = right
    left = 0
    while left == 0 || (left < n && arr[left - 1] <= arr[left])
        while right < n && arr[left] > arr[right]
            right += 1
        end
        answer = [answer, right - left - 1].min
        left += 1
        break if left >= n
    end
    answer
end
