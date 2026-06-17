class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var windowSet = Set<Int>()
        
        for i in 0..<nums.count {
            if i > k {
                windowSet.remove(nums[i - k - 1])
            }
            
            if windowSet.contains(nums[i]) {
                return true
            }
            
            windowSet.insert(nums[i])
        }
        
        return false
    }
}
