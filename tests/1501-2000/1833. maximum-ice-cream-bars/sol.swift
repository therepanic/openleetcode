class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var xMin = costs[0]
        var xMax = costs[0]
        for x in costs {
            xMin = min(xMin, x)
            xMax = max(xMax, x)
        }
        var freq = [Int](repeating: 0, count: xMax + 1)
        for x in costs {
            freq[x] += 1
            xMin = min(xMin, x)
        }
        var cnt = 0
        var remaining = coins
        for x in xMin...xMax {
            let f = freq[x]
            if f == 0 { continue }
            let buy = min(remaining / x, f)
            if buy == 0 { break }
            cnt += buy
            remaining -= buy * x
        }
        return cnt
    }
}
