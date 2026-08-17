class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 || n == 2 {
            return 1
        } else {
            var a = [Int](repeating: 0, count: n + 1)
            a[0] = 0
            a[1] = 1
            var v = 1
            for i in 2...n {
                if i % 2 == 0 {
                    a[i] = a[v]
                } else {
                    a[i] = a[v] + a[v + 1]
                    v += 1
                }
            }
            return a.max()!
        }
    }
}
