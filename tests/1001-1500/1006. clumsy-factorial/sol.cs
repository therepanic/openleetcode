public class Solution {
    public int Clumsy(int n) {
        if (n == 1) {
            return 1;
        } else if (n == 2) {
            return 2;
        } else if (n == 3) {
            return 6;
        } else if (n == 4) {
            return 7;
        } else {
            if (n % 4 == 0) {
                return n + 1;
            } else if (n % 4 <= 2) {
                return n + 2;
            } else {
                return n - 1;
            }
        }
    }
}
