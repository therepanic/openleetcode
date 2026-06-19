public class Solution {
    public IList<int> FindDuplicates(int[] nums) {
        IList<int> r = new List<int>();
        foreach (int x in nums) {
            int idx = Math.Abs(x) - 1;
            if (nums[idx] < 0) {
                r.Add(Math.Abs(x));
            } else {
                nums[idx] = -nums[idx];
            }
        }
        return r;
    }
}
