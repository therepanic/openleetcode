class Solution {
    public int largestOverlap(int[][] img1, int[][] img2) {
        int n = img1.length;
        List<int[]> a = new ArrayList<>();
        List<int[]> b = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (img1[i][j] == 1) a.add(new int[]{i, j});
                if (img2[i][j] == 1) b.add(new int[]{i, j});
            }
        }
        Map<String, Integer> cnt = new HashMap<>();
        for (int[] p1 : a) {
            for (int[] p2 : b) {
                String key = (p1[0] - p2[0]) + "," + (p1[1] - p2[1]);
                cnt.put(key, cnt.getOrDefault(key, 0) + 1);
            }
        }
        int max = 0;
        for (int val : cnt.values()) {
            max = Math.max(max, val);
        }
        return max;
    }
}
