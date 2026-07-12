public class Solution {
    public int MinDominoRotations(int[] tops, int[] bottoms) {
        int n = tops.Length;
        int res = int.MaxValue;
        int[] face = new int[7];
        for (int i = 0; i < n; i++) {
            face[tops[i]]++;
            if (bottoms[i] != tops[i]) {
                face[bottoms[i]]++;
            }
        }
        for (int x = 1; x <= 6; x++) {
            if (face[x] < n) {
                continue;
            }
            int maintainTop = 0;
            int maintainBottom = 0;
            bool possible = true;
            for (int i = 0; i < n; i++) {
                if (tops[i] != x) {
                    maintainTop++;
                }
                if (bottoms[i] != x) {
                    maintainBottom++;
                }
            }
            if (possible) {
                res = Math.Min(res, Math.Min(maintainTop, maintainBottom));
            }
        }
        return res == int.MaxValue ? -1 : res;
    }
}
