public class Solution {
    public int LongestSubarray(int[] nums, int limit) {
        var maxq = new LinkedList<int>();
        var minq = new LinkedList<int>();
        int left = 0, max_len = 1;
        for (int right = 0; right < nums.Length; right++) {
            while (maxq.Count > 0 && nums[maxq.Last.Value] <= nums[right]) {
                maxq.RemoveLast();
            }
            maxq.AddLast(right);
            while (minq.Count > 0 && nums[minq.Last.Value] >= nums[right]) {
                minq.RemoveLast();
            }
            minq.AddLast(right);
            while (nums[maxq.First.Value] - nums[minq.First.Value] > limit) {
                left++;
                if (maxq.First.Value < left) {
                    maxq.RemoveFirst();
                }
                if (minq.First.Value < left) {
                    minq.RemoveFirst();
                }
            }
            max_len = Math.Max(max_len, right - left + 1);
        }
        return max_len;
    }
}
