public class Solution {
    public int FindLeastNumOfUniqueInts(int[] arr, int k) {
        var counts = new Dictionary<int, int>();
        foreach (int num in arr) {
            if (counts.ContainsKey(num)) {
                counts[num]++;
            } else {
                counts[num] = 1;
            }
        }
        int remaining = counts.Count;
        var frequencies = new List<int>(counts.Values);
        frequencies.Sort();
        foreach (int count in frequencies) {
            if (k < count) {
                break;
            }
            k -= count;
            remaining--;
        }
        return remaining;
    }
}
