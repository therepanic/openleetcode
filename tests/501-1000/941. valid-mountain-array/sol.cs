public class Solution {
    public bool ValidMountainArray(int[] arr) {
        int n = arr.Length;
        int i = 0;
        
        while (i+1 < n && arr[i] < arr[i+1]) {
            i++;
        }
        
        if (i == 0 || i == n-1) {
            return false;
        }
        
        while (i+1 < n && arr[i] > arr[i+1]) {
            i++;
        }
        
        return i == n-1;
    }
}
