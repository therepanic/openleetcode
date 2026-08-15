public class Solution {
    public int MinDeletions(string s) {
        int[] count = new int[26];
        foreach (char c in s) {
            count[c - 'a']++;
        }
        List<int> freqs = new List<int>();
        foreach (int f in count) {
            if (f > 0) freqs.Add(f);
        }
        freqs.Sort((a, b) => b.CompareTo(a));
        int deletes = 0;
        for (int idx = 1; idx < freqs.Count; idx++) {
            if (freqs[idx] >= freqs[idx - 1]) {
                int target = Math.Max(0, freqs[idx - 1] - 1);
                deletes += (freqs[idx] - target);
                freqs[idx] = target;
            }
        }
        return deletes;
    }
}
