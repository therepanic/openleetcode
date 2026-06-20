class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count < nums.count
    }
}
