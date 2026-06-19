public class Solution {
    private bool Helper(int[] nums, int perK, int k) {
        int count = 1;
        int currSum = 0;
        foreach (int num in nums) {
            if (currSum + num > perK) {
                count++;
                currSum = num;
            } else {
                currSum += num;
            }
        }
        return count <= k;
    }

    public int SplitArray(int[] nums, int k) {
        int high = 0;
        int low = 0;
        foreach (int num in nums) {
            high += num;
            if (num > low) low = num;
        }
        int soln = 0;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (Helper(nums, mid, k)) {
                soln = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return soln;
    }
}
