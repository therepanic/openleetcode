class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var a = Int.max
        var b = Int.max
        var f = false
        for x in nums {
            if x <= a {
                a = x
            } else if x <= b {
                b = x
            } else {
                f = true
            }
        }
        return f
    }
}
