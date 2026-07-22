class Solution {
    public int findBestValue(int[] arr, int target) {
        int low = 0;
        int high = 0;
        for (int x : arr) {
            if (x > high) high = x;
        }
        
        int result = high;
        int minDiff = Integer.MAX_VALUE;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            int currSum = 0;
            for (int x : arr) {
                currSum += Math.min(x, mid);
            }
            int diff = Math.abs(currSum - target);
            
            if (diff < minDiff || (diff == minDiff && mid < result)) {
                minDiff = diff;
                result = mid;
            }
            
            if (currSum < target) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        
        return result;
    }
}
