public class Solution {
    public bool CanThreePartsEqualSum(int[] arr) {
        int total = 0;
        foreach (int num in arr) {
            total += num;
        }
        if (total % 3 != 0) {
            return false;
        }
        int target = total / 3;
        int currentSum = 0;
        int partitions = 0;
        for (int i = 0; i < arr.Length; i++) {
            currentSum += arr[i];
            if (currentSum == target) {
                partitions++;
                currentSum = 0;
                if (partitions == 2 && i < arr.Length - 1) {
                    return true;
                }
            }
        }
        return false;
    }
}
