class Solution {
  int videoStitching(List<List<int>> clips, int time) {
    clips.sort((a, b) => a[0].compareTo(b[0]));
    int end = 0;
    int farthest = 0;
    int res = 0;
    int i = 0;
    while (farthest < time) {
      int prevFarthest = farthest;
      while (i < clips.length && clips[i][0] <= end) {
        farthest = farthest > clips[i][1] ? farthest : clips[i][1];
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
