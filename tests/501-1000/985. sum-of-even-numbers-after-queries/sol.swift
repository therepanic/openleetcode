class Solution {
    func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var nums = nums
        var total = nums.filter { $0 % 2 == 0 }.reduce(0, +)
        var ans: [Int] = []
        for q in queries {
            let val = q[0], idx = q[1]
            if nums[idx] % 2 == 0 {
                total -= nums[idx]
            }
            nums[idx] += val
            if nums[idx] % 2 == 0 {
                total += nums[idx]
            }
            ans.append(total)
        }
        return ans
    }
}
