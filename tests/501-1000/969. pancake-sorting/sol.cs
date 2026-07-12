public class Solution {
    public IList<int> PancakeSort(int[] arr) {
        int n = arr.Length;
        IList<int> result = new List<int>();
        
        for (int i = 0; i < n; i++) {
            int target = n - i;
            int position = 0;
            
            for (int j = 0; j < n - i; j++) {
                if (arr[j] == target) {
                    position = j;
                    break;
                }
            }
            
            if (position == n - i - 1) {
                continue;
            }
            
            if (position > 0) {
                result.Add(position + 1);
                Array.Reverse(arr, 0, position + 1);
            }
            
            result.Add(n - i);
            Array.Reverse(arr, 0, n - i);
        }
        
        return result;
    }
}
