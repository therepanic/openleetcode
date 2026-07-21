public class Solution {
    public bool CheckIfExist(int[] arr) {
        int zeroCount = 0;
        foreach (int num in arr) {
            if (num == 0) zeroCount++;
        }
        if (zeroCount >= 2) return true;

        foreach (int i in arr) {
            if (i != 0) {
                foreach (int j in arr) {
                    if (j == i * 2) return true;
                }
            }
        }
        return false;
    }
}
