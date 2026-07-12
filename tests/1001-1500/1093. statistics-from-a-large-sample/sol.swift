class Solution {
    func sampleStats(_ count: [Int]) -> [Double] {
        func kth(_ k: Int) -> Int {
            var acc = 0
            for (v, c) in count.enumerated() {
                acc += c
                if acc >= k {
                    return v
                }
            }
            return 0
        }

        var tot = 0
        var cnt = 0
        var mini: Int?
        var maxi = 0
        var mode = 0
        var modeCnt = 0

        for (v, c) in count.enumerated() {
            if c > 0 {
                if mini == nil {
                    mini = v
                }
                maxi = v
                tot += c
                cnt += v * c
                if c > modeCnt {
                    modeCnt = c
                    mode = v
                }
            }
        }

        let m: Double
        if tot % 2 == 1 {
            m = Double(kth(tot / 2 + 1))
        } else {
            m = Double(kth(tot / 2) + kth(tot / 2 + 1)) / 2.0
        }

        return [Double(mini!), Double(maxi), Double(cnt) / Double(tot), m, Double(mode)]
    }
}
