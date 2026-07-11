public class Solution {
    public int Flipgame(int[] fronts, int[] backs) {
        HashSet<int> bad = new HashSet<int>();
        for (int i = 0; i < fronts.Length; i++) {
            if (fronts[i] == backs[i]) {
                bad.Add(fronts[i]);
            }
        }
        int best = 2001;
        for (int i = 0; i < fronts.Length; i++) {
            if (!bad.Contains(fronts[i]) && fronts[i] < best) {
                best = fronts[i];
            }
            if (!bad.Contains(backs[i]) && backs[i] < best) {
                best = backs[i];
            }
        }
        return best <= 2000 ? best : 0;
    }
}
