public class Solution {
    public int FindTheDistanceValue(int[] arr1, int[] arr2, int d) {
        Array.Sort(arr2);
        int count = 0;
        foreach (int num in arr1) {
            int leftIndex = LowerBound(arr2, num - d);
            int rightIndex = UpperBound(arr2, num + d);
            if (leftIndex == rightIndex) {
                count++;
            }
        }
        return count;
    }
    
    private int LowerBound(int[] arr, int target) {
        int left = 0, right = arr.Length;
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
    
    private int UpperBound(int[] arr, int target) {
        int left = 0, right = arr.Length;
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
