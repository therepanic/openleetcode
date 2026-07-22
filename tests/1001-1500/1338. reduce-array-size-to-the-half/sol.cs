public class Solution {
    public int MinSetSize(int[] arr) {
        Dictionary<int, int> freq = new Dictionary<int, int>();
        foreach (int num in arr) {
            if (freq.ContainsKey(num)) {
                freq[num]++;
            } else {
                freq[num] = 1;
            }
        }
        
        List<int> counts = new List<int>(freq.Values);
        counts.Sort((a, b) => b.CompareTo(a));
        
        int sumRemoved = 0;
        int minSetSize = 0;
        foreach (int count in counts) {
            sumRemoved += count;
            minSetSize++;
            if (sumRemoved >= arr.Length / 2) {
                return minSetSize;
            }
        }
        return minSetSize;
    }
}
