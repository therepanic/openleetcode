class Solution {
    public int minDays(int n) {
        int ans = 0;
        java.util.Queue<Integer> queue = new java.util.LinkedList<>();
        queue.offer(n);
        java.util.Set<Integer> seen = new java.util.HashSet<>();
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int i = 0; i < size; i++) {
                int x = queue.poll();
                if (x == 0) return ans;
                seen.add(x);
                if (!seen.contains(x-1)) queue.offer(x-1);
                if (x % 2 == 0 && !seen.contains(x/2)) queue.offer(x/2);
                if (x % 3 == 0 && !seen.contains(x/3)) queue.offer(x/3);
            }
            ans++;
        }
        return ans;
    }
}
