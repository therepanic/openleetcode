class Solution {
    func maximumPopulation(_ logs: [[Int]]) -> Int {
        let l = logs.count
        var a = [Int]()
        var r = 0
        var y = 0
        for i in logs {
            a.append(i[0])
        }
        for j in 0..<l {
            var c = 0
            for k in 0..<l {
                if a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k {
                    c += 1
                }
            }
            if c > r {
                r = c
                y = a[j]
            }
            if c == r && r > 0 {
                if a[j] < y {
                    y = a[j]
                }
            }
        }
        if y == 0 {
            return a.min()!
        }
        return y
    }
}
