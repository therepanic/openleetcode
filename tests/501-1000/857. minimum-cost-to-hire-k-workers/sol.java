class Solution {
    public double mincostToHireWorkers(int[] quality, int[] wage, int k) {
        int n = quality.length;
        double[][] workers = new double[n][2];
        for (int i = 0; i < n; ++i) {
            workers[i][0] = (double)wage[i] / quality[i];
            workers[i][1] = quality[i];
        }
        
        Arrays.sort(workers, (a, b) -> Double.compare(a[0], b[0]));
        
        double minCost = Double.MAX_VALUE;
        long currentQualitySum = 0;
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        
        for (double[] w : workers) {
            double ratio = w[0];
            int q = (int)w[1];
            
            currentQualitySum += q;
            maxHeap.offer(q);
            
            if (maxHeap.size() > k) {
                currentQualitySum -= maxHeap.poll();
            }
            
            if (maxHeap.size() == k) {
                minCost = Math.min(minCost, ratio * currentQualitySum);
            }
        }
        
        return minCost;
    }
}
