class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        var res = 0
        var left = 0
        var total = 0
        for right in 0..<arr.count {
            total += arr[right]
            if right - left + 1 == k {
                if total / k >= threshold {
                    res += 1
                }
                total -= arr[left]
                left += 1
            }
        }
        return res
    }
}
