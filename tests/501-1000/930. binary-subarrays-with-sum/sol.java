class Solution {
    public int numSubarraysWithSum(int[] nums, int goal) {
        int n = nums.length;
        int[] posOf1s = new int[n + 2];
        int idx = 0;
        posOf1s[idx++] = -1;
        
        int total = 0;
        int count = 0;
        
        if (goal == 0) {
            for (int num : nums) {
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
                posOf1s[idx++] = i;
            }
        }
        posOf1s[idx++] = n;
        
        for (int i = 1; i < idx - goal; i++) {
            int leftChoices = posOf1s[i] - posOf1s[i - 1];
            int rightChoices = posOf1s[i + goal] - posOf1s[i + goal - 1];
            total += leftChoices * rightChoices;
        }
        
        return total;
    }
}
