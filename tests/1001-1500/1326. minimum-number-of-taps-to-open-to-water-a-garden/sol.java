class Solution {
    public int minTaps(int n, int[] ranges) {
        int[] maxRange = new int[n + 1];
        
        for (int i = 0; i < ranges.length; i++) {
            int left = Math.max(0, i - ranges[i]);
            int right = Math.min(n, i + ranges[i]);
            maxRange[left] = Math.max(maxRange[left], right);
        }
        
        int end = 0, farthest = 0, taps = 0;
        int i = 0;
        
        while (end < n) {
            while (i <= end) {
                farthest = Math.max(farthest, maxRange[i]);
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
