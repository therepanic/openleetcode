class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: -1, count: n)
        for i in 0..<n {
            for j in i+1..<n {
                if nums[j] > nums[i] {
                    res[i] = nums[j]
                    break
                }
            }
            if res[i] == -1 {
                for j in 0..<i {
                    if nums[j] > nums[i] {
                        res[i] = nums[j]
                        break
                    }
                }
            }
        }
        return res
    }
}
