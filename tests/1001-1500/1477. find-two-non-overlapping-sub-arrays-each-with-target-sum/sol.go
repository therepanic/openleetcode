func minSumOfLengths(arr []int, target int) int {
    n := len(arr)
    bestLeft := make([]int, n)
    for i := range bestLeft {
        bestLeft[i] = n
    }
    minTotal := int(^uint(0) >> 1) // max int
    left := 0
    curr := 0
    for right := 0; right < n; right++ {
        curr += arr[right]
        for curr > target {
            curr -= arr[left]
            left++
        }
        if curr == target {
            length := right - left + 1
            if right > 0 {
                if bestLeft[right-1] < length {
                    bestLeft[right] = bestLeft[right-1]
                } else {
                    bestLeft[right] = length
                }
            } else {
                bestLeft[right] = length
            }
            if left > 0 && bestLeft[left-1] != n {
                if bestLeft[left-1]+length < minTotal {
                    minTotal = bestLeft[left-1] + length
                }
            }
        } else {
            if right > 0 {
                bestLeft[right] = bestLeft[right-1]
            }
        }
    }
    if minTotal == int(^uint(0)>>1) {
        return -1
    }
    return minTotal
}
