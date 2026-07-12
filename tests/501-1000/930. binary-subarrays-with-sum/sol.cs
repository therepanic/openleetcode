public class Solution {
    public int NumSubarraysWithSum(int[] nums, int goal) {
        int n = nums.Length;
        var posOf1s = new System.Collections.Generic.List<int>();
        posOf1s.Add(-1);
        int total = 0;
        int count = 0;
        
        if (goal == 0) {
            foreach (int num in nums) {
                if (num == 0) {
                    count++;
                    total += count;
                } else {
                    count = 0;
                }
            }
            return total;
        }
        
        for (int i = 0; i < n; i++) {
            if (nums[i] == 1) {
                posOf1s.Add(i);
            }
        }
        posOf1s.Add(n);
        
        for (int i = 1; i < posOf1s.Count - goal; i++) {
            int leftChoices = posOf1s[i] - posOf1s[i - 1];
            int rightChoices = posOf1s[i + goal] - posOf1s[i + goal - 1];
            total += leftChoices * rightChoices;
        }
        
        return total;
    }
}
