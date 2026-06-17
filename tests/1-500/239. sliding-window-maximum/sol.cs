public class Solution {
    public int[] MaxSlidingWindow(int[] nums, int k) {
        int n = nums.Length;
        int[] res = new int[n - k + 1];
        var q = new LinkedList<int>();
        for (int idx = 0; idx < n; idx++) {
            int num = nums[idx];
            while (q.Count > 0 && q.Last.Value < num) {
                q.RemoveLast();
            }
            q.AddLast(num);
            if (idx >= k && nums[idx - k] == q.First.Value) {
                q.RemoveFirst();
            }
            if (idx >= k - 1) {
                res[idx - k + 1] = q.First.Value;
            }
        }
        return res;
    }
}
