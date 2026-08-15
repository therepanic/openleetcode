func findLengthOfShortestSubarray(arr []int) int {
    n := len(arr)
    right := n - 1
    for right > 0 && arr[right-1] <= arr[right] {
        right--
    }
    if right == 0 {
        return 0
    }
    answer := right
    left := 0
    for left == 0 || (left < n && arr[left-1] <= arr[left]) {
        for right < n && arr[left] > arr[right] {
            right++
        }
        if right-left-1 < answer {
            answer = right - left - 1
        }
        left++
        if left >= n {
            break
        }
    }
    return answer
}
