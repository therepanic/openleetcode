class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var highest = 0
        for i in 0..<32 {
            if (n & (1 << i)) != 0 {
                highest = i
            }
        }

        var ans = 0
        var add = true
        var i = highest
        while i >= 0 {
            if (n & (1 << i)) != 0 {
                let val = (1 << (i + 1)) - 1
                if add {
                    ans += val
                } else {
                    ans -= val
                }
                add = !add
            }
            i -= 1
        }

        return ans
    }
}
