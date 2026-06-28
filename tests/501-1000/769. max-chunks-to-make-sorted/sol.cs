public class Solution {
    public int MaxChunksToSorted(int[] arr) {
        int ans = 0;
        int prevMax = 0;
        for (int idx = 0; idx < arr.Length; idx++) {
            prevMax = Math.Max(prevMax, arr[idx]);
            if (prevMax == idx) {
                ans++;
            }
        }
        return ans;
    }
}
