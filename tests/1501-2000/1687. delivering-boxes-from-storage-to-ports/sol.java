class Solution {
    public int boxDelivering(int[][] boxes, int portsCount, int maxBoxes, int maxWeight) {
        int n = boxes.length;
        int[] ports = new int[n+1];
        int[] weights = new int[n+1];
        for (int i = 0; i < n; i++) {
            ports[i+1] = boxes[i][0];
            weights[i+1] = boxes[i][1];
        }
        int[] prefixWeights = new int[n+1];
        for (int i = 1; i <= n; i++) {
            prefixWeights[i] = prefixWeights[i-1] + weights[i];
        }
        int[] portsCnt = new int[n+2];
        for (int i = 2; i <= n; i++) {
            portsCnt[i] = portsCnt[i-1] + (ports[i] != ports[i-1] ? 1 : 0);
        }
        portsCnt[n+1] = portsCnt[n];
        int[] dp = new int[n+1];
        java.util.Deque<Integer> queue = new java.util.ArrayDeque<>();
        queue.add(0);
        int left = 0;
        for (int i = 1; i <= n; i++) {
            while (i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight) {
                if (!queue.isEmpty() && queue.peekFirst() == left) {
                    queue.pollFirst();
                }
                left++;
            }
            dp[i] = 2 + portsCnt[i] + (dp[queue.peekFirst()] - portsCnt[queue.peekFirst()+1]);
            int idx = dp[i] - portsCnt[i+1];
            while (!queue.isEmpty() && (dp[queue.peekLast()] - portsCnt[queue.peekLast()+1]) >= idx) {
                queue.pollLast();
            }
            queue.addLast(i);
        }
        return dp[n];
    }
}
