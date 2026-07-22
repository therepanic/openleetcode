class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var ans = 0
        var currentStart = start
        var remaining = n
        while remaining > 0 {
            ans ^= currentStart
            currentStart += 2
            remaining -= 1
        }
        return ans
    }
}
