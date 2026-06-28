class Solution {
    public int maxChunksToSorted(int[] arr) {
        int n = arr.length;
        int[] minRight = new int[n];
        int currentMin = Integer.MAX_VALUE;
        for (int i = n - 1; i >= 0; i--) {
            if (arr[i] < currentMin) {
                currentMin = arr[i];
            }
            minRight[i] = currentMin;
        }
        
        int chunks = 0;
        int currentMax = Integer.MIN_VALUE;
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > currentMax) {
                currentMax = arr[i];
            }
            if (currentMax <= minRight[i + 1]) {
                chunks++;
            }
        }
        return chunks + 1;
    }
}
