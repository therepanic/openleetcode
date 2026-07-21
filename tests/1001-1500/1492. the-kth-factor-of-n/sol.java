class Solution {
    public int kthFactor(int n, int k) {
        java.util.ArrayList<Integer> ab = new java.util.ArrayList<>();
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                ab.add(i);
            }
        }
        if (ab.size() < k) {
            return -1;
        } else {
            return ab.get(k - 1);
        }
    }
}
