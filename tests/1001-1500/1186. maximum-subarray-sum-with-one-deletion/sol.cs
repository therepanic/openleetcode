public class Solution {
    public int MaximumSum(int[] arr) {
        int n = arr.Length;
        if (n == 1) {
            return arr[0];
        }
        
        int maxNoDelete = arr[0];
        int maxOneDelete = arr[0];
        int result = arr[0];
        
        for (int i = 1; i < n; i++) {
            int prevNoDelete = maxNoDelete;
            maxNoDelete = Math.Max(maxNoDelete + arr[i], arr[i]);
            maxOneDelete = Math.Max(maxOneDelete + arr[i], prevNoDelete);
            result = Math.Max(result, Math.Max(maxNoDelete, maxOneDelete));
        }
        
        return result;
    }
}
