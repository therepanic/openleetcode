class Solution {
    func minimumEffort(_ tasks: [[Int]]) -> Int {
        let sorted = tasks.sorted { ($0[1] - $0[0]) > ($1[1] - $1[0]) }
        func test(_ bal: Int) -> Bool {
            var b = bal
            for t in sorted {
                if b < t[1] { return false }
                b -= t[0]
            }
            return true
        }
        var lo = 0, hi = 1000000001
        while lo < hi {
            let mid = (lo + hi) / 2
            if test(mid) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
