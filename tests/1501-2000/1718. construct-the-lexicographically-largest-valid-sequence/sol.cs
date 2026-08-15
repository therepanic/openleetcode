public class Solution {
    public int[] ConstructDistancedSequence(int n) {
        int[] result = new int[2 * n - 1];
        bool[] used = new bool[n + 1];
        Backtrack(result, used, n, 0);
        return result;
    }

    private bool Backtrack(int[] result, bool[] used, int n, int index) {
        int idx = index;
        while (idx < result.Length && result[idx] != 0) {
            idx++;
        }
        if (idx == result.Length) {
            return true;
        }

        for (int i = n; i >= 1; i--) {
            if (used[i]) continue;

            if (i == 1) {
                result[idx] = 1;
                used[1] = true;
                if (Backtrack(result, used, n, idx + 1)) {
                    return true;
                }
                result[idx] = 0;
                used[1] = false;
            } else if (idx + i < result.Length && result[idx + i] == 0) {
                result[idx] = i;
                result[idx + i] = i;
                used[i] = true;
                if (Backtrack(result, used, n, idx + 1)) {
                    return true;
                }
                result[idx] = 0;
                result[idx + i] = 0;
                used[i] = false;
            }
        }

        return false;
    }
}
