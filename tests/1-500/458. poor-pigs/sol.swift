class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let base = minutesToTest / minutesToDie + 1
        var ans = 0
        var n = 1
        while n < buckets {
            n *= base
            ans += 1
        }
        return ans
    }
}
