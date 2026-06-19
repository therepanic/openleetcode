public class Solution {
    private Dictionary<int, List<int>> dict;
    private Random random;

    public Solution(int[] nums) {
        dict = new Dictionary<int, List<int>>();
        random = new Random();
        for (int i = 0; i < nums.Length; i++) {
            if (!dict.ContainsKey(nums[i])) {
                dict[nums[i]] = new List<int>();
            }
            dict[nums[i]].Add(i);
        }
    }
    
    public int Pick(int target) {
        var indices = dict[target];
        return indices[random.Next(indices.Count)];
    }
}
