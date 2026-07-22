public class Solution {
    public int MinTaps(int n, int[] ranges) {
        int[] maxRange = new int[n + 1];
        
        for (int index = 0; index < ranges.Length; index++) {
            int left = Math.Max(0, index - ranges[index]);
            int right = Math.Min(n, index + ranges[index]);
            maxRange[left] = Math.Max(maxRange[left], right);
        }
        
        int end = 0, farthest = 0, taps = 0;
        int i = 0;
        
        while (end < n) {
            while (i <= end) {
                farthest = Math.Max(farthest, maxRange[i]);
                i++;
            }
            
            if (farthest <= end) {
                return -1;
            }
            
            end = farthest;
            taps++;
        }
        
        return taps;
    }
}
