class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        var res = Set(1...9)
        var remaining = n - 1
        
        while remaining > 0 {
            var next = Set<Int>()
            for val in res {
                let last = val % 10
                if last + k < 10 {
                    next.insert(val * 10 + last + k)
                }
                if last - k >= 0 {
                    next.insert(val * 10 + last - k)
                }
            }
            res = next
            remaining -= 1
        }
        
        return Array(res)
    }
}
