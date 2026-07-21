class Solution {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        let n = arr.count
        var bestLeft = [Int](repeating: n, count: n)
        var minTotal = Int.max
        var left = 0
        var curr = 0
        for right in 0..<n {
            curr += arr[right]
            while curr > target {
                curr -= arr[left]
                left += 1
            }
            if curr == target {
                let length = right - left + 1
                if right > 0 {
                    bestLeft[right] = min(bestLeft[right - 1], length)
                } else {
                    bestLeft[right] = length
                }
                if left > 0 && bestLeft[left - 1] != n {
                    minTotal = min(minTotal, bestLeft[left - 1] + length)
                }
            } else {
                if right > 0 {
                    bestLeft[right] = bestLeft[right - 1]
                }
            }
        }
        return minTotal == Int.max ? -1 : minTotal
    }
}
