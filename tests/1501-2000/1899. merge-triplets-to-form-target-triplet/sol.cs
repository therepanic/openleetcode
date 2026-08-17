public class Solution {
    public bool MergeTriplets(int[][] triplets, int[] target) {
        foreach (var t in triplets) {
            if (t[0] == target[0] && t[1] == target[1] && t[2] == target[2]) {
                return true;
            }
        }
        int[] curr = new int[] {0, 0, 0};
        foreach (var t in triplets) {
            bool flag = false;
            if (target[0] == t[0] && curr[0] != target[0]) {
                flag = true;
            }
            if (target[1] == t[1] && curr[1] != target[1]) {
                flag = true;
            }
            if (target[2] == t[2] && curr[2] != target[2]) {
                flag = true;
            }
            if (flag) {
                int[] temp = (int[])curr.Clone();
                curr[0] = Math.Max(curr[0], t[0]);
                curr[1] = Math.Max(curr[1], t[1]);
                curr[2] = Math.Max(curr[2], t[2]);
                if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
                    curr = temp;
                }
            }
        }
        return curr[0] == target[0] && curr[1] == target[1] && curr[2] == target[2];
    }
}
