public class Solution {
    public int MinOperations(int[] nums) {
        int length = nums.Length;
        int minOps = length;
        int[] uniqueNums = nums.Distinct().OrderBy(x => x).ToArray();
        int right = 0;
        
        for (int left = 0; left < uniqueNums.Length; left++) {
            while (right < uniqueNums.Length && uniqueNums[right] < uniqueNums[left] + length) {
                right++;
            }
            
            minOps = Math.Min(minOps, length - (right - left));
        }
        
        return minOps;
    }
}
