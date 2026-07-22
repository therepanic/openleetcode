class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var s: [Int] = []
        var res: [String] = []
        var a = 0
        for i in 1...n {
            if s == target {
                return res
            }
            s.append(i)
            res.append("Push")
            if s[a] != target[a] {
                s.removeLast()
                res.append("Pop")
            } else {
                a += 1
            }
        }
        return res
    }
}
