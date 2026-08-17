public class Solution {
    public int AddRungs(int[] rungs, int dist) {
        int curr = 0;
        int res = 0;
        foreach (int rung in rungs) {
            if (rung - curr > dist) {
                res += (rung - curr - 1) / dist;
            }
            curr = rung;
        }
        return res;
    }
}
