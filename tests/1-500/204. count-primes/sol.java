public class Solution {
    public int countPrimes(int n) {
        if (n <= 2) return 0;
        boolean[] isPrime = new boolean[n];
        java.util.Arrays.fill(isPrime, true);
        isPrime[0] = isPrime[1] = false;
        for (int i = 2; i * i < n; i++) {
            if (!isPrime[i]) continue;
            for (int j = i * i; j < n; j += i) isPrime[j] = false;
        }
        int ans = 0;
        for (boolean x : isPrime) if (x) ans++;
        return ans;
    }
}
