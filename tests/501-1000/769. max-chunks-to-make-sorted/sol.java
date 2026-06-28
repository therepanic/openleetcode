class Solution {
    public int maxChunksToSorted(int[] arr) {
        int ans = 0;
        int prevMax = 0;
        for (int idx = 0; idx < arr.length; idx++) {
            prevMax = Math.max(prevMax, arr[idx]);
            if (prevMax == idx) {
                ans++;
            }
        }
        return ans;
    }
}
