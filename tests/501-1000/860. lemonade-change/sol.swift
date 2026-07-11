class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var f = 0
        var t = 0
        for bill in bills {
            if bill == 5 {
                f += 1
            } else if bill == 10 {
                if f >= 1 {
                    f -= 1
                    t += 1
                } else {
                    return false
                }
            } else {
                if f >= 1 && t >= 1 {
                    t -= 1
                    f -= 1
                } else if f >= 3 {
                    f -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
}
