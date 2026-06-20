public class Solution {
    public int CountPrimes(int n) {
        if (n <= 2) return 0;
        bool[] isPrime = new bool[n];
        System.Array.Fill(isPrime, true);
        isPrime[0] = isPrime[1] = false;
        for (int i = 2; i * i < n; i++) {
            if (!isPrime[i]) continue;
            for (int j = i * i; j < n; j += i) isPrime[j] = false;
        }
        int ans = 0;
        foreach (bool x in isPrime) if (x) ans++;
        return ans;
    }
}
