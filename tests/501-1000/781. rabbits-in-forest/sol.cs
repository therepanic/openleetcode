public class Solution {
    public int NumRabbits(int[] answers) {
        Dictionary<int, int> mpp = new Dictionary<int, int>();
        foreach (int a in answers) {
            if (mpp.ContainsKey(a)) {
                mpp[a]++;
            } else {
                mpp[a] = 1;
            }
        }
        int total = 0;
        foreach (var kvp in mpp) {
            int x = kvp.Key;
            int count = kvp.Value;
            total += (int)Math.Ceiling((double)count / (x + 1)) * (x + 1);
        }
        return total;
    }
}
