class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var l = 0
        var r = n
        while l < r {
            let m = (l + r + 1) / 2
            if citations[n - m] >= m {
                l = m
            } else {
                r = m - 1
            }
        }
        return l
    }
}
