public class Solution {
    public int[] MostCompetitive(int[] nums, int k) {
        var stack = new List<int>();
        int n = nums.Length;
        for (int i = 0; i < n; i++) {
            while (stack.Count > 0 && stack[stack.Count - 1] > nums[i]) {
                if (n - 1 - i >= k - stack.Count) {
                    stack.RemoveAt(stack.Count - 1);
                } else {
                    break;
                }
            }
            stack.Add(nums[i]);
        }
        return stack.Take(k).ToArray();
    }
}
