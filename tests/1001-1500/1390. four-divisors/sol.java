class Solution {
    public int sumFourDivisors(int[] nums) {
        if (nums.length == 0) return 0;
        int maxNum = 0;
        for (int num : nums) if (num > maxNum) maxNum = num;
        if (maxNum < 2) return 0;

        boolean[] sieve = new boolean[maxNum + 1];
        for (int i = 2; i <= maxNum; i++) sieve[i] = true;

        for (int p = 2; p * p <= maxNum; p++) {
            if (sieve[p]) {
                for (int multiple = p * p; multiple <= maxNum; multiple += p) {
                    sieve[multiple] = false;
                }
            }
        }

        int total = 0;
        for (int x : nums) {
            // p^3 case
            int p = (int) Math.round(Math.pow(x, 1.0 / 3));
            if (p >= 0 && p <= maxNum && p * p * p == x && sieve[p]) {
                total += 1 + p + p * p + x;
                continue;
            }

            // p * q case
            for (int i = 2; i * i <= x; i++) {
                if (x % i == 0) {
                    int j = x / i;
                    if (i != j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j]) {
                        total += 1 + i + j + x;
                    }
                    break;
                }
            }
        }
        return total;
    }
}
