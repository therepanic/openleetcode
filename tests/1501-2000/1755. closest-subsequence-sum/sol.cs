public class Solution {
    public int MinAbsDifference(int[] nums, int goal) {
        Func<int[], List<int>> sums = (values) => {
            var result = new List<int> { 0 };
            foreach (var value in values) {
                int currentLen = result.Count;
                for (int i = 0; i < currentLen; i++) {
                    result.Add(result[i] + value);
                }
            }
            return result;
        };
        int mid = nums.Length / 2;
        var left = sums(nums.Take(mid).ToArray());
        var right = sums(nums.Skip(mid).ToArray());
        left.Sort();
        right.Sort();
        int answer = Math.Abs(goal);
        int j = right.Count - 1;
        foreach (int value in left) {
            while (j > 0 && right[j - 1] >= goal - value) {
                j--;
            }
            answer = Math.Min(answer, Math.Abs(value + right[j] - goal));
            if (j > 0) {
                answer = Math.Min(answer, Math.Abs(value + right[j - 1] - goal));
            }
        }
        return answer;
    }
}
