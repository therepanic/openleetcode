public class Solution {
    public IList<IList<int>> FindSubsequences(int[] nums) {
        HashSet<string> seen = new HashSet<string>();
        List<IList<int>> result = new List<IList<int>>();
        Backtrack(0, new List<int>(), nums, seen, result);
        return result;
    }
    
    private void Backtrack(int index, List<int> path, int[] nums, HashSet<string> seen, List<IList<int>> result) {
        if (path.Count >= 2) {
            string key = string.Join(",", path);
            if (!seen.Contains(key)) {
                seen.Add(key);
                result.Add(new List<int>(path));
            }
        }
        for (int i = index; i < nums.Length; i++) {
            if (path.Count == 0 || nums[i] >= path[path.Count - 1]) {
                path.Add(nums[i]);
                Backtrack(i + 1, path, nums, seen, result);
                path.RemoveAt(path.Count - 1);
            }
        }
    }
}
