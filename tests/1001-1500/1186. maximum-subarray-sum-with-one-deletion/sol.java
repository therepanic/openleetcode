class Solution {
    public int maximumSum(int[] arr) {
        int n = arr.length;
        if (n == 1) {
            return arr[0];
        }
        
        int maxNoDelete = arr[0];
        int maxOneDelete = arr[0];
        int result = arr[0];
        
        for (int i = 1; i < n; i++) {
            int prevNoDelete = maxNoDelete;
            maxNoDelete = Math.max(maxNoDelete + arr[i], arr[i]);
            maxOneDelete = Math.max(maxOneDelete + arr[i], prevNoDelete);
            result = Math.max(result, Math.max(maxNoDelete, maxOneDelete));
        }
        
        return result;
    }
}
