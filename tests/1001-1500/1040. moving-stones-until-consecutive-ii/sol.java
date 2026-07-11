class Solution {
    public int[] numMovesStonesII(int[] stones) {
        Arrays.sort(stones);
        int n = stones.length;
        
        int maxMoves = Math.max(stones[n - 1] - stones[1] - (n - 2), 
                                stones[n - 2] - stones[0] - (n - 2));
        
        int minMoves = n;
        int left = 0;
        for (int right = 0; right < n; right++) {
            while (stones[right] - stones[left] + 1 > n) {
                left++;
            }
            int currentWindowSize = right - left + 1;
            if (currentWindowSize == n - 1 && stones[right] - stones[left] + 1 == n - 1) {
                minMoves = Math.min(minMoves, 2);
            } else {
                minMoves = Math.min(minMoves, n - currentWindowSize);
            }
        }
        
        return new int[]{minMoves, maxMoves};
    }
}
