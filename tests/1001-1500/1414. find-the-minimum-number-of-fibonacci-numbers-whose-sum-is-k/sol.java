class Solution {
    public int findMinFibonacciNumbers(int k) {
        java.util.ArrayList<Integer> fib = new java.util.ArrayList<>();
        fib.add(1);
        fib.add(1);
        while (fib.get(fib.size() - 1) <= k) {
            fib.add(fib.get(fib.size() - 1) + fib.get(fib.size() - 2));
        }
        
        int count = 0;
        int i = fib.size() - 1;
        
        while (k > 0) {
            if (fib.get(i) <= k) {
                k -= fib.get(i);
                count++;
            }
            i--;
        }
        
        return count;
    }
}
