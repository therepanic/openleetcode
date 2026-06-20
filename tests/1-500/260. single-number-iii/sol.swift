class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var x = 0
        for n in nums {
            x ^= n
        }

        let bit = x & -x
        var a = 0
        var b = 0
        for n in nums {
            if (n & bit) != 0 {
                a ^= n
            } else {
                b ^= n
            }
        }

        return [a, b]
    }
}
