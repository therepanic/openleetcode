class Solution {
    public boolean mergeTriplets(int[][] triplets, int[] target) {
        for (int[] t : triplets) {
            if (t[0] == target[0] && t[1] == target[1] && t[2] == target[2]) {
                return true;
            }
        }
        int[] curr = new int[]{0, 0, 0};
        for (int[] t : triplets) {
            boolean flag = false;
            if (target[0] == t[0] && curr[0] != target[0]) flag = true;
            if (target[1] == t[1] && curr[1] != target[1]) flag = true;
            if (target[2] == t[2] && curr[2] != target[2]) flag = true;
            if (flag) {
                int[] temp = curr.clone();
                curr[0] = Math.max(curr[0], t[0]);
                curr[1] = Math.max(curr[1], t[1]);
                curr[2] = Math.max(curr[2], t[2]);
                if (curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2]) {
                    curr = temp;
                }
            }
        }
        return curr[0] == target[0] && curr[1] == target[1] && curr[2] == target[2];
    }
}
