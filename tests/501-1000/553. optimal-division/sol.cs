public class Solution {
    public string OptimalDivision(int[] nums) {
        string result = nums[0].ToString();
        
        if (nums.Length == 1) {
            return result;
        }
        
        if (nums.Length == 2) {
            return result + "/" + nums[1].ToString();
        }
        
        result += "/(" + nums[1].ToString();
        for (int i = 2; i < nums.Length; i++) {
            result += "/" + nums[i].ToString();
        }
        
        return result + ")";
    }
}
