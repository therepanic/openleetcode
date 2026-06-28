class Solution {
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var lo = 1
        var hi = m * n
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            var count = 0
            for i in 1...m {
                count += n < mid / i ? n : mid / i
            }
            if count >= k {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
