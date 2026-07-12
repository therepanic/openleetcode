class Solution {
    public int racecar(int target) {
        java.util.Queue<int[]> q = new java.util.LinkedList<>();
        q.offer(new int[]{0, 1, 0});
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int cp = cur[0], cs = cur[1], nm = cur[2];
            if (cp == target) return nm;
            q.offer(new int[]{cp + cs, cs * 2, nm + 1});
            if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
                if (cs < 0) {
                    q.offer(new int[]{cp, 1, nm + 1});
                } else {
                    q.offer(new int[]{cp, -1, nm + 1});
                }
            }
        }
        return -1;
    }
}
