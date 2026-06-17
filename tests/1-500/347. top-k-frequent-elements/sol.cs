public class Solution {
    public int[] TopKFrequent(int[] nums, int k) {
        Dictionary<int, int> freq = new Dictionary<int, int>();
        foreach (int i in nums) {
            if (freq.ContainsKey(i)) {
                freq[i]++;
            } else {
                freq[i] = 1;
            }
        }
        return freq.OrderByDescending(x => x.Value)
                   .Take(k)
                   .Select(x => x.Key)
                   .ToArray();
    }
}
