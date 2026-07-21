class Solution {
    public int countLargestGroup(int n) {
        Map<Integer, Integer> mpp = new HashMap<>();
        int maxi = 0, count = 0;

        for (int i = 1; i <= n; i++) {
            int x = digsum(i);
            mpp.put(x, mpp.getOrDefault(x, 0) + 1);
            maxi = Math.max(maxi, mpp.get(x));
        }

        for (int v : mpp.values()) {
            if (v == maxi) {
                count++;
            }
        }
        return count;
    }

    private int digsum(int n) {
        int s = 0;
        while (n > 0) {
            s += n % 10;
            n /= 10;
        }
        return s;
    }
}
