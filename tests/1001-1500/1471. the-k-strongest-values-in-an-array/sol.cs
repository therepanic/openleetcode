public class Solution {
    public int[] GetStrongest(int[] arr, int k) {
        Array.Sort(arr);
        int m = arr[(arr.Length - 1) / 2];
        
        int left = 0, right = arr.Length - 1;
        int[] result = new int[k];
        for (int i = 0; i < k; i++) {
            if (Math.Abs(arr[right] - m) >= Math.Abs(arr[left] - m)) {
                result[i] = arr[right];
                right--;
            } else {
                result[i] = arr[left];
                left++;
            }
        }
        return result;
    }
}
