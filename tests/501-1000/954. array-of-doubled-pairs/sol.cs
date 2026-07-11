public class Solution {
    public bool CanReorderDoubled(int[] arr) {
        Dictionary<int, int> freq = new Dictionary<int, int>();
        foreach (int i in arr) {
            if (freq.ContainsKey(i)) freq[i]++;
            else freq[i] = 1;
        }
        
        Array.Sort(arr, (a, b) => Math.Abs(a).CompareTo(Math.Abs(b)));
        foreach (int val in arr) {
            if (freq[val] == 0) continue;
            int target = val * 2;
            if (freq.ContainsKey(target) && freq[target] > 0) {
                freq[val]--;
                freq[target]--;
            } else {
                return false;
            }
        }
        return true;
    }
}
