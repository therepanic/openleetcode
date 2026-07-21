class Solution {
    public int findTheDistanceValue(int[] arr1, int[] arr2, int d) {
        java.util.Arrays.sort(arr2);
        int count = 0;
        for (int num : arr1) {
            int leftIndex = lowerBound(arr2, num - d);
            int rightIndex = upperBound(arr2, num + d);
            if (leftIndex == rightIndex) {
                count++;
            }
        }
        return count;
    }
    
    private int lowerBound(int[] arr, int target) {
        int left = 0, right = arr.length;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        return left;
    }
    
    private int upperBound(int[] arr, int target) {
        int left = 0, right = arr.length;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] <= target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        return left;
    }
}
