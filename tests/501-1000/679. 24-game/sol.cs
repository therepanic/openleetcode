public class Solution {
    private const double EPS = 1e-6;

    public bool JudgePoint24(int[] cards) {
        List<double> nums = cards.Select(c => (double)c).ToList();
        return Dfs(nums);
    }

    private bool Dfs(List<double> nums) {
        if (nums.Count == 1) {
            return Math.Abs(nums[0] - 24.0) < EPS;
        }

        for (int i = 0; i < nums.Count; i++) {
            for (int j = 0; j < nums.Count; j++) {
                if (i == j) continue;

                List<double> nextNums = new List<double>();
                for (int k = 0; k < nums.Count; k++) {
                    if (k != i && k != j) {
                        nextNums.Add(nums[k]);
                    }
                }

                double a = nums[i], b = nums[j];
                List<double> candidates = new List<double> { a + b, a - b, b - a, a * b };
                if (Math.Abs(b) > EPS) candidates.Add(a / b);
                if (Math.Abs(a) > EPS) candidates.Add(b / a);

                foreach (double val in candidates) {
                    nextNums.Add(val);
                    if (Dfs(nextNums)) return true;
                    nextNums.RemoveAt(nextNums.Count - 1);
                }
            }
        }
        return false;
    }
}
