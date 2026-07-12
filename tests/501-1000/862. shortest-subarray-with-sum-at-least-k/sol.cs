public class Solution {
    public int ShortestSubarray(int[] nums, int k) {
        int n = nums.Length;
        long[] prefix = new long[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        
        int best = n + 1;
        var dq = new System.Collections.Generic.LinkedList<int>();
        for (int i = 0; i < prefix.Length; i++) {
            while (dq.Count > 0 && prefix[i] - prefix[dq.First.Value] >= k) {
                best = Math.Min(best, i - dq.First.Value);
                dq.RemoveFirst();
            }
            while (dq.Count > 0 && prefix[dq.Last.Value] >= prefix[i]) {
                dq.RemoveLast();
            }
            dq.AddLast(i);
        }
        
        return best == n + 1 ? -1 : best;
    }
}
