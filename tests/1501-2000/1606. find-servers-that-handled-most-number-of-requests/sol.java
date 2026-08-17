import java.util.*;

class Solution {
    public List<Integer> busiestServers(int k, int[] arrival, int[] load) {
        PriorityQueue<Integer> available = new PriorityQueue<>();
        for (int i = 0; i < k; i++) available.add(i);
        PriorityQueue<int[]> busy = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        int[] res = new int[k];
        for (int i = 0; i < arrival.length; i++) {
            int a = arrival[i];
            while (!busy.isEmpty() && busy.peek()[0] <= a) {
                int x = busy.poll()[1];
                available.add(i + ((x - i) % k + k) % k);
            }
            if (!available.isEmpty()) {
                int j = available.poll() % k;
                busy.add(new int[]{a + load[i], j});
                res[j]++;
            }
        }
        int max = 0;
        for (int r : res) max = Math.max(max, r);
        List<Integer> ans = new ArrayList<>();
        for (int i = 0; i < k; i++) if (res[i] == max) ans.add(i);
        return ans;
    }
}
