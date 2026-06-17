class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let sorted = envelopes.sorted { a, b in
            a[0] == b[0] ? a[1] > b[1] : a[0] < b[0]
        }
        var result = [Int]()
        for e in sorted {
            let h = e[1]
            var lo = 0, hi = result.count
            while lo < hi {
                let mid = lo + (hi - lo) / 2
                if result[mid] < h {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            if lo == result.count {
                result.append(h)
            } else {
                result[lo] = h
            }
        }
        return result.count
    }
}
