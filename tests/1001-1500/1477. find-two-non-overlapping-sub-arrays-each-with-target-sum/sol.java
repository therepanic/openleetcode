class Solution {
    public int minSumOfLengths(int[] arr, int target) {
        int n = arr.length;
        int[] bestLeft = new int[n];
        for (int i = 0; i < n; i++) {
            bestLeft[i] = n;
        }
        int minTotal = Integer.MAX_VALUE;
        int left = 0;
        int curr = 0;
        for (int right = 0; right < n; right++) {
            curr += arr[right];
            while (curr > target) {
                curr -= arr[left];
                left++;
            }
            if (curr == target) {
                int length = right - left + 1;
                if (right > 0) {
                    bestLeft[right] = Math.min(bestLeft[right - 1], length);
                } else {
                    bestLeft[right] = length;
                }
                if (left > 0 && bestLeft[left - 1] != n) {
                    minTotal = Math.min(minTotal, bestLeft[left - 1] + length);
                }
            } else {
                if (right > 0) {
                    bestLeft[right] = bestLeft[right - 1];
                }
            }
        }
        return minTotal == Integer.MAX_VALUE ? -1 : minTotal;
    }
}
