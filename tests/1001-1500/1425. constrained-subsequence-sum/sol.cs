public class Solution {
    public int ConstrainedSubsetSum(int[] nums, int k) {
        var q = new LinkedList<(int, int)>();
        int res = int.MinValue;
        for (int i = 0; i < nums.Length; i++) {
            int num = nums[i];
            int total = q.Count == 0 ? num : num + q.First.Value.Item2;
            res = Math.Max(res, total);
            while (q.Count > 0 && total >= q.Last.Value.Item2) {
                q.RemoveLast();
            }
            if (total > 0) {
                q.AddLast((i, total));
            }
            if (q.Count > 0 && q.First.Value.Item1 == i - k) {
                q.RemoveFirst();
            }
        }
        return res;
    }
}
