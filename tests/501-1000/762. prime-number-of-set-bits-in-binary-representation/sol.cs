public class Solution {
    public int CountPrimeSetBits(int left, int right) {
        int count = 0;
        int[] primes = new int[] { 2, 3, 5, 7, 11, 13, 17, 19 };
        for (int i = left; i <= right; i++) {
            int setBits = PopCount(i);
            if (IsPrime(setBits, primes)) {
                count++;
            }
        }
        return count;
    }
    
    private int PopCount(int n) {
        int count = 0;
        while (n != 0) {
            n &= (n - 1);
            count++;
        }
        return count;
    }
    
    private bool IsPrime(int n, int[] primes) {
        for (int i = 0; i < primes.Length; i++) {
            if (primes[i] == n) return true;
        }
        return false;
    }
}
