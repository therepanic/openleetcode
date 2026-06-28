public class Solution {
    public int MaxChunksToSorted(int[] arr) {
        int n = arr.Length;
        int[] minRight = new int[n];
        int currentMin = int.MaxValue;
        for (int i = n - 1; i >= 0; i--) {
            if (arr[i] < currentMin) {
                currentMin = arr[i];
            }
            minRight[i] = currentMin;
        }
        
        int chunks = 0;
        int currentMax = int.MinValue;
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
