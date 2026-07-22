class Solution {
    public int[] getStrongest(int[] arr, int k) {
        java.util.Arrays.sort(arr);
        int m = arr[(arr.length - 1) / 2];
        
        int left = 0, right = arr.length - 1;
        int[] result = new int[k];
        for (int i = 0; i < k; i++) {
            if (Math.abs(arr[right] - m) >= Math.abs(arr[left] - m)) {
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
