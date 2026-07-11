class Solution {
    public int minDominoRotations(int[] tops, int[] bottoms) {
        int n = tops.length;
        int res = Integer.MAX_VALUE;
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
            boolean possible = true;
            for (int i = 0; i < n; i++) {
                if (tops[i] != x) {
                    maintainTop++;
                }
                if (bottoms[i] != x) {
                    maintainBottom++;
                }
            }
            if (possible) {
                res = Math.min(res, Math.min(maintainTop, maintainBottom));
            }
        }
        return res == Integer.MAX_VALUE ? -1 : res;
    }
}
