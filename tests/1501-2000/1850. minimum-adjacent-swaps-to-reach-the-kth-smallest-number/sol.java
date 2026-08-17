class Solution {
    public int getMinSwaps(String num, int k) {
        char[] arr = num.toCharArray();
        char[] target = num.toCharArray();
        
        for (int i = 0; i < k; i++) {
            nextPermutation(target);
        }
        
        int swaps = 0;
        arr = num.toCharArray();
        
        for (int i = 0; i < arr.length; i++) {
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
    
    private void nextPermutation(char[] arr) {
        int i = arr.length - 2;
        while (i >= 0 && arr[i] >= arr[i + 1]) i--;
        if (i == -1) return;
        
        int j = arr.length - 1;
        while (arr[j] <= arr[i]) j--;
        
        char temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        
        int left = i + 1, right = arr.length - 1;
        while (left < right) {
            temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left++;
            right--;
        }
    }
}
