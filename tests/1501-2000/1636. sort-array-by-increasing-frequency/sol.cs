public class Solution {
    public int[] FrequencySort(int[] nums) {
        var freq = new Dictionary<int, int>();
        foreach (int num in nums) {
            if (freq.ContainsKey(num)) freq[num]++;
            else freq[num] = 1;
        }
        Array.Sort(nums, (a, b) => {
            int freqCompare = freq[a].CompareTo(freq[b]);
            if (freqCompare != 0) return freqCompare;
            return b.CompareTo(a);
        });
        return nums;
    }
}
