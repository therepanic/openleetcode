class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let seen = Set(nums)
        var best = 0
        for num in seen {
            if seen.contains(num - 1) { continue }
            var current = num
            var streak = 1
            while seen.contains(current + 1) { current += 1; streak += 1 }
            best = Swift.max(best, streak)
        }
        return best
    }
}
