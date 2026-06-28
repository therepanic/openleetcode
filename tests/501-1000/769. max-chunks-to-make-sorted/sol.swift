class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var ans = 0
        var prevMax = 0
        for (idx, x) in arr.enumerated() {
            prevMax = max(prevMax, x)
            if prevMax == idx {
                ans += 1
            }
        }
        return ans
    }
}
