public class Solution {
    public IList<string> SummaryRanges(int[] nums) {
        List<string> result = new List<string>();
        int i = 0;
        
        while (i < nums.Length) {
            int start = nums[i];
            int j = i;
            while (j + 1 < nums.Length && nums[j + 1] == nums[j] + 1) {
                j++;
            }
            
            if (nums[j] == start) {
                result.Add(start.ToString());
            } else {
                result.Add(start + "->" + nums[j]);
            }
            
            i = j + 1;
        }
        
        return result;
    }
}
