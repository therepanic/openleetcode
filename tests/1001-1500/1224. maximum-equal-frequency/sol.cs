public class Solution {
    public int MaxEqualFreq(int[] nums) {
        var counts = new Dictionary<int, int>();
        var frequencyCounts = new Dictionary<int, int>();
        int best = 0;

        for (int i = 0; i < nums.Length; i++) {
            int value = nums[i];
            int index = i + 1;
            int previous = counts.GetValueOrDefault(value, 0);
            if (previous > 0) {
                frequencyCounts[previous]--;
                if (frequencyCounts[previous] == 0) {
                    frequencyCounts.Remove(previous);
                }
            }
            counts[value] = previous + 1;
            int frequency = previous + 1;
            frequencyCounts[frequency] = frequencyCounts.GetValueOrDefault(frequency, 0) + 1;

            if (frequencyCounts.Count == 1) {
                var entry = frequencyCounts.First();
                int onlyFrequency = entry.Key;
                int valueCount = entry.Value;
                if (onlyFrequency == 1 || valueCount == 1) {
                    best = index;
                }
            } else if (frequencyCounts.Count == 2) {
                var keys = frequencyCounts.Keys.OrderBy(k => k).ToArray();
                int low = keys[0];
                int high = keys[1];
                if ((low == 1 && frequencyCounts[low] == 1) || (high == low + 1 && frequencyCounts[high] == 1)) {
                    best = index;
                }
            }
        }

        return best;
    }
}
