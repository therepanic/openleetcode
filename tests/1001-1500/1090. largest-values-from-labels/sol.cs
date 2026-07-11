public class Solution {
    public int LargestValsFromLabels(int[] values, int[] labels, int numWanted, int useLimit) {
        int n = values.Length;
        int[][] pairs = new int[n][];
        for (int i = 0; i < n; i++) {
            pairs[i] = new int[] { values[i], labels[i] };
        }
        System.Array.Sort(pairs, (a, b) => b[0].CompareTo(a[0]));
        int res = 0;
        Dictionary<int, int> freq = new Dictionary<int, int>();
        foreach (int[] pair in pairs) {
            if (numWanted == 0) break;
            int value = pair[0];
            int label = pair[1];
            if (!freq.ContainsKey(label) || freq[label] < useLimit) {
                res += value;
                if (freq.ContainsKey(label)) freq[label]++;
                else freq[label] = 1;
                numWanted--;
            }
        }
        return res;
    }
}
