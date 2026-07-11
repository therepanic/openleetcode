public class Solution {
    public int VideoStitching(int[][] clips, int time) {
        Array.Sort(clips, (a, b) => a[0].CompareTo(b[0]));
        int end = 0;
        int farthest = 0;
        int res = 0;
        int i = 0;
        while (farthest < time) {
            int prevFarthest = farthest;
            while (i < clips.Length && clips[i][0] <= end) {
                farthest = Math.Max(farthest, clips[i][1]);
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
