public class Solution {
    public int BoxDelivering(int[][] boxes, int portsCount, int maxBoxes, int maxWeight) {
        int n = boxes.Length;
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
        var queue = new System.Collections.Generic.LinkedList<int>();
        queue.AddLast(0);
        int left = 0;
        for (int i = 1; i <= n; i++) {
            while (i - left > maxBoxes || prefixWeights[i] - prefixWeights[left] > maxWeight) {
                if (queue.Count > 0 && queue.First.Value == left) {
                    queue.RemoveFirst();
                }
                left++;
            }
            dp[i] = 2 + portsCnt[i] + (dp[queue.First.Value] - portsCnt[queue.First.Value+1]);
            int idx = dp[i] - portsCnt[i+1];
            while (queue.Count > 0 && (dp[queue.Last.Value] - portsCnt[queue.Last.Value+1]) >= idx) {
                queue.RemoveLast();
            }
            queue.AddLast(i);
        }
        return dp[n];
    }
}
