import java.util.*;

class Solution {
    public int[] assignTasks(int[] servers, int[] tasks) {
        int n = servers.length;
        int m = tasks.length;
        
        PriorityQueue<int[]> available = new PriorityQueue<>((a, b) -> 
            a[0] != b[0] ? a[0] - b[0] : a[1] - b[1]);
        for (int i = 0; i < n; i++) {
            available.offer(new int[]{servers[i], i});
        }
        
        PriorityQueue<int[]> busy = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        int[] ans = new int[m];
        int time = 0;
        
        for (int i = 0; i < m; i++) {
            time = Math.max(time, i);
            while (!busy.isEmpty() && busy.peek()[0] <= time) {
                int[] s = busy.poll();
                available.offer(new int[]{s[1], s[2]});
            }
            
            if (available.isEmpty()) {
                time = busy.peek()[0];
                while (!busy.isEmpty() && busy.peek()[0] <= time) {
                    int[] s = busy.poll();
                    available.offer(new int[]{s[1], s[2]});
                }
            }
            
            int[] server = available.poll();
            busy.offer(new int[]{time + tasks[i], server[0], server[1]});
            ans[i] = server[1];
        }
        
        return ans;
    }
}
