public class Solution {
    public bool ContainsPattern(int[] arr, int m, int k) {
        for (int i = 0; i <= arr.Length - m * k; i++) {
            bool match = true;
            for (int j = 0; j < m * (k - 1); j++) {
                if (arr[i + j] != arr[i + j + m]) {
                    match = false;
                    break;
                }
            }
            if (match) return true;
        }
        return false;
    }
}
