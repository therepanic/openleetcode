class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var h = [Int](repeating: 0, count: n)
        h[0] = 1
        var i = 0, j = 0, k = 0

        for idx in 1..<n {
            let m = min(h[i] * 2, h[j] * 3, h[k] * 5)
            h[idx] = m

            if m == h[i] * 2 { i += 1 }
            if m == h[j] * 3 { j += 1 }
            if m == h[k] * 5 { k += 1 }
        }

        return h[n - 1]
    }
}
