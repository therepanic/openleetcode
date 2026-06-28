class Solution {
    public int[] smallestRange(List<List<Integer>> nums) {
        PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        int curMax = Integer.MIN_VALUE;
        for (int i = 0; i < nums.size(); i++) {
            int val = nums.get(i).get(0);
            heap.offer(new int[]{val, i, 0});
            curMax = Math.max(curMax, val);
        }
        int[] small = new int[]{Integer.MIN_VALUE, Integer.MAX_VALUE};
        while (!heap.isEmpty()) {
            int[] cur = heap.poll();
            int curMin = cur[0], listIdx = cur[1], i = cur[2];
            if ((long) curMax - curMin < (long) small[1] - small[0]) {
                small[0] = curMin;
                small[1] = curMax;
            }
            if (i + 1 < nums.get(listIdx).size()) {
                int nxt = nums.get(listIdx).get(i + 1);
                heap.offer(new int[]{nxt, listIdx, i + 1});
                curMax = Math.max(curMax, nxt);
            } else {
                break;
            }
        }
        return small;
    }
}
