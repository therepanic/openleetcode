public class Solution {
    public int FindShortestSubArray(int[] nums) {
        Dictionary<int, int> left = new Dictionary<int, int>();
        Dictionary<int, int> right = new Dictionary<int, int>();
        Dictionary<int, int> count = new Dictionary<int, int>();
        
        for (int i = 0; i < nums.Length; i++) {
            int x = nums[i];
            if (!left.ContainsKey(x)) {
                left[x] = i;
            }
            right[x] = i;
            if (count.ContainsKey(x)) {
                count[x]++;
            } else {
                count[x] = 1;
            }
        }
        
        int ans = nums.Length;
        int degree = 0;
        foreach (int c in count.Values) {
            degree = Math.Max(degree, c);
        }
        
        foreach (var kvp in count) {
            int x = kvp.Key;
            if (kvp.Value == degree) {
                ans = Math.Min(ans, right[x] - left[x] + 1);
            }
        }
        
        return ans;
    }
}
