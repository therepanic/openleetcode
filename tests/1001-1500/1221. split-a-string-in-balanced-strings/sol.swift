class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var bal = 0
        var count = 0
        for c in s {
            if c == "L" {
                bal += 1
            } else if c == "R" {
                bal -= 1
            }
            if bal == 0 {
                count += 1
            }
        }
        return count
    }
}
