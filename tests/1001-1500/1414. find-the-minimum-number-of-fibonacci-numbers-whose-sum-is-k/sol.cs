public class Solution {
    public int FindMinFibonacciNumbers(int k) {
        List<int> fib = new List<int> {1, 1};
        while (fib[fib.Count - 1] <= k) {
            fib.Add(fib[fib.Count - 1] + fib[fib.Count - 2]);
        }
        
        int count = 0;
        int i = fib.Count - 1;
        
        while (k > 0) {
            if (fib[i] <= k) {
                k -= fib[i];
                count++;
            }
            i--;
        }
        
        return count;
    }
}
