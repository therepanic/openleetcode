class Solution {
    func minOperationsToFlip(_ expression: String) -> Int {
        let chars = Array(expression)
        let n = chars.count
        var loc: [Int: Int] = [:]
        var stack: [Int] = []
        for i in stride(from: n-1, through: 0, by: -1) {
            if chars[i] == ")" {
                stack.append(i)
            } else if chars[i] == "(" {
                loc[stack.removeLast()] = i
            }
        }
        
        func solve(_ lo: Int, _ hi: Int) -> (Int, Int) {
            if lo == hi { return (Int(String(chars[lo]))!, 1) }
            if chars[hi] == ")" && loc[hi] == lo { return solve(lo+1, hi-1) }
            let mid = (loc[hi] ?? hi) - 1
            let (v, c) = solve(mid+1, hi)
            let (vv, cc) = solve(lo, mid-1)
            let val: Int
            let chg: Int
            if chars[mid] == "|" {
                val = v | vv
                if v == 0 && vv == 0 { chg = min(c, cc) }
                else if v == 1 && vv == 1 { chg = 1 + min(c, cc) }
                else { chg = 1 }
            } else {
                val = v & vv
                if v == 0 && vv == 0 { chg = 1 + min(c, cc) }
                else if v == 1 && vv == 1 { chg = min(c, cc) }
                else { chg = 1 }
            }
            return (val, chg)
        }
        
        return solve(0, n-1).1
    }
}
