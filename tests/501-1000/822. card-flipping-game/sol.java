class Solution {
    public int flipgame(int[] fronts, int[] backs) {
        java.util.HashSet<Integer> bad = new java.util.HashSet<>();
        for (int i = 0; i < fronts.length; i++) {
            if (fronts[i] == backs[i]) {
                bad.add(fronts[i]);
            }
        }
        int best = 2001;
        for (int i = 0; i < fronts.length; i++) {
            if (!bad.contains(fronts[i]) && fronts[i] < best) {
                best = fronts[i];
            }
            if (!bad.contains(backs[i]) && backs[i] < best) {
                best = backs[i];
            }
        }
        return best <= 2000 ? best : 0;
    }
}
