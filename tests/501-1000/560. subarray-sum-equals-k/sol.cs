public class Solution {
    public int SubarraySum(int[] nums, int k) {
        var subNum = new Dictionary<int, int>();
        subNum[0] = 1;
        int total = 0;
        int count = 0;
        
        foreach (int n in nums) {
            total += n;
            
            if (subNum.ContainsKey(total - k)) {
                count += subNum[total - k];
            }
            
            if (subNum.ContainsKey(total)) {
                subNum[total]++;
            } else {
                subNum[total] = 1;
            }
        }
        
        return count;
    }
}
