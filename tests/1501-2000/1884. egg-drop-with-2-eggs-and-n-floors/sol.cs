public class Solution {
    public int TwoEggDrop(int n) {
        int l = 1, r = n, res = 0;
        while (l <= r) {
            int moves = (l + r) / 2;
            if ((long)(1 + moves) * moves / 2 >= n) {
                res = moves;
                r = moves - 1;
            } else {
                l = moves + 1;
            }
        }
        return res;
    }
}
