public class Solution {
    public int GetMinSwaps(string num, int k) {
        char[] arr = num.ToCharArray();
        char[] target = num.ToCharArray();
        
        for (int i = 0; i < k; i++) {
            NextPermutation(target);
        }
        
        int swaps = 0;
        arr = num.ToCharArray();
        
        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] == target[i]) continue;
            
            int j = i;
            while (arr[j] != target[i]) j++;
            
            while (j > i) {
                char temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
                j--;
                swaps++;
            }
        }
        
        return swaps;
    }
    
    private void NextPermutation(char[] arr) {
        int i = arr.Length - 2;
        while (i >= 0 && arr[i] >= arr[i + 1]) i--;
        if (i == -1) return;
        
        int j = arr.Length - 1;
        while (arr[j] <= arr[i]) j--;
        
        char temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        
        int left = i + 1, right = arr.Length - 1;
        while (left < right) {
            temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left++;
            right--;
        }
    }
}
