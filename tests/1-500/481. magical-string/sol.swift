class Solution {
    func magicalString(_ n: Int) -> Int {
        if n <= 0 { return 0 }
        if n <= 3 { return 1 }
        var s = [1, 2, 2]
        var i = 2
        while s.count < n {
            let nextVal = 3 - s.last!
            let count = s[i]
            for _ in 0..<count {
                if s.count >= n { break }
                s.append(nextVal)
            }
            i += 1
        }
        return s.prefix(n).filter { $0 == 1 }.count
    }
}
