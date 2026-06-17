public class Solution {
    public bool ContainsNearbyDuplicate(int[] nums, int k) {
        HashSet<int> windowSet = new HashSet<int>();
        
        for (int i = 0; i < nums.Length; i++) {
            if (i > k) {
                windowSet.Remove(nums[i - k - 1]);
            }
            
            if (windowSet.Contains(nums[i])) {
                return true;
            }
            
            windowSet.Add(nums[i]);
        }
        
        return false;
    }
}
