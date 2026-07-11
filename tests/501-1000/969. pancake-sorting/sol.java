class Solution {
    public List<Integer> pancakeSort(int[] arr) {
        int n = arr.length;
        List<Integer> result = new ArrayList<>();
        
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
                result.add(position + 1);
                reverse(arr, 0, position);
            }
            
            result.add(n - i);
            reverse(arr, 0, n - i - 1);
        }
        
        return result;
    }
    
    private void reverse(int[] arr, int left, int right) {
        while (left < right) {
            int temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left++;
            right--;
        }
    }
}
