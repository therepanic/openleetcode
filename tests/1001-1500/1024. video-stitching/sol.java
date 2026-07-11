class Solution {
    public int videoStitching(int[][] clips, int time) {
        java.util.Arrays.sort(clips, (a, b) -> Integer.compare(a[0], b[0]));
        int end = 0;
        int farthest = 0;
        int res = 0;
        int i = 0;
        while (farthest < time) {
            int prevFarthest = farthest;
            while (i < clips.length && clips[i][0] <= end) {
                farthest = Math.max(farthest, clips[i][1]);
                i++;
            }
            if (farthest == prevFarthest) {
                return -1;
            }
            end = farthest;
            res++;
        }
        return res;
    }
}
