class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var ans: [Bool] = []
        for i in 0..<l.count {
            let sub = Array(nums[l[i]...r[i]]).sorted()
            var valid = true
            if sub.count > 2 {
                let d = sub[1] - sub[0]
                for j in 1..<(sub.count-1) {
                    if sub[j+1] - sub[j] != d {
                        valid = false
                        break
                    }
                }
            }
            ans.append(valid)
        }
        return ans
    }
}
