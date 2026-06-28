class Solution {
    public boolean checkPerfectNumber(int num) {
        if (num == 1)
            return false;
        int count = 1;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                count += i + num / i;
            }
        }
        return num == count;
    }
}
