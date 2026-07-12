public class Solution {
    public double MincostToHireWorkers(int[] quality, int[] wage, int k) {
        int n = quality.Length;
        var workers = new (double ratio, int quality)[n];
        for (int i = 0; i < n; ++i)
            workers[i] = ((double)wage[i] / quality[i], quality[i]);
        
        Array.Sort(workers, (a, b) => a.ratio.CompareTo(b.ratio));
        
        double minCost = double.MaxValue;
        long currentQualitySum = 0;
        var maxHeap = new List<int>();
        
        foreach (var (ratio, q) in workers) {
            currentQualitySum += q;
            maxHeap.Add(q);
            maxHeap.Sort((a, b) => b.CompareTo(a));
            
            if (maxHeap.Count > k) {
                currentQualitySum -= maxHeap[0];
                maxHeap.RemoveAt(0);
            }
            
            if (maxHeap.Count == k) {
                minCost = Math.Min(minCost, ratio * currentQualitySum);
            }
        }
        
        return minCost;
    }
}
