public class Solution {
    public int FindBestValue(int[] arr, int target) {
        int GetMutatedSum(int value) {
            int sum = 0;
            foreach (int x in arr) {
                sum += Math.Min(x, value);
            }
            return sum;
        }
        
        int low = 0;
        int high = arr.Max();
        int result = high;
        int minDiff = int.MaxValue;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            int currSum = GetMutatedSum(mid);
            int diff = Math.Abs(currSum - target);
            
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
