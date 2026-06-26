class Solution {
    public String optimalDivision(int[] nums) {
        StringBuilder result = new StringBuilder();
        result.append(nums[0]);
        
        if (nums.length == 1) {
            return result.toString();
        }
        
        if (nums.length == 2) {
            return result.append('/').append(nums[1]).toString();
        }
        
        result.append("/(").append(nums[1]);
        for (int i = 2; i < nums.length; i++) {
            result.append('/').append(nums[i]);
        }
        
        return result.append(')').toString();
    }
}
