class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var q: [Int] = []
        for i in 1...9 {
            q.append(i)
        }
        var i = 0
        while i < q.count {
            let x = q[i]
            let d = x % 10
            if d < 9 {
                q.append(x * 10 + d + 1)
            }
            i += 1
        }
        return q.filter { low <= $0 && $0 <= high }
    }
}
