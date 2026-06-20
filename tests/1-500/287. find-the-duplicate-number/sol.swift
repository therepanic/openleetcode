class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        
        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return fast
    }
}
