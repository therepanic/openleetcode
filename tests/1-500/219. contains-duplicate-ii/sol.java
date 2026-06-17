class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        Set<Integer> windowSet = new HashSet<>();
        
        for (int i = 0; i < nums.length; i++) {
            if (i > k) {
                windowSet.remove(nums[i - k - 1]);
            }
            
            if (windowSet.contains(nums[i])) {
                return true;
            }
            
            windowSet.add(nums[i]);
        }
        
        return false;
    }
}
