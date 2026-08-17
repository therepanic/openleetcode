class Solution {
    public int[] getOrder(int[][] tasks) {
        int n = tasks.length;
        int[][] indexed = new int[n][3];
        for (int i = 0; i < n; i++) {
            indexed[i][0] = tasks[i][0];
            indexed[i][1] = tasks[i][1];
            indexed[i][2] = i;
        }
        Arrays.sort(indexed, (a, b) -> Integer.compare(a[0], b[0]));
        
        int[] result = new int[n];
        PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> {
            if (a[1] != b[1]) return Integer.compare(a[1], b[1]);
            return Integer.compare(a[2], b[2]);
        });
        
        long time = 0;
        int idx = 0;
        int resIdx = 0;
        
        while (idx < n || !heap.isEmpty()) {
            if (heap.isEmpty() && time < indexed[idx][0]) {
                time = indexed[idx][0];
            }
            
            while (idx < n && indexed[idx][0] <= time) {
                heap.offer(indexed[idx]);
                idx++;
            }
            
            int[] task = heap.poll();
            result[resIdx++] = task[2];
            time += task[1];
        }
        
        return result;
    }
}
