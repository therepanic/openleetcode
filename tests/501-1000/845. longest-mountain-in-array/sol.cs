public class Solution {
    public int LongestMountain(int[] arr) {
        int n = arr.Length;
        int best = 0;
        int i = 1;
        
        while (i < n - 1) {
            if (arr[i - 1] < arr[i] && arr[i] > arr[i + 1]) {
                int left = i - 1;
                int right = i + 1;
                while (left > 0 && arr[left - 1] < arr[left]) {
                    left--;
                }
                while (right < n - 1 && arr[right] > arr[right + 1]) {
                    right++;
                }
                best = Math.Max(best, right - left + 1);
                i = right;
            }
            i++;
        }
        
        return best;
    }
}
