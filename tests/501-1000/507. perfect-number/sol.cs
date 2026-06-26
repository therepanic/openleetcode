public class Solution {
    public bool CheckPerfectNumber(int num) {
        if (num == 1)
            return false;
        int count = 1;
        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                count += i + num / i;
            }
        }
        return num == count;
    }
}
