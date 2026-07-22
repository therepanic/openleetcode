public class Solution {
    public int MaxPerformance(int n, int[] speed, int[] efficiency, int k) {
        const int MOD = 1000000007;
        int[][] engineers = new int[n][];
        for (int i = 0; i < n; i++) {
            engineers[i] = new int[] { efficiency[i], speed[i] };
        }
        Array.Sort(engineers, (a, b) => b[0].CompareTo(a[0]));
        
        var pq = new SortedDictionary<int, int>();
        int count = 0;
        long curSum = 0;
        long ans = 0;
        
        foreach (var eng in engineers) {
            while (count > k - 1) {
                var iterator = pq.GetEnumerator();
                iterator.MoveNext();
                int smallest = iterator.Current.Key;
                curSum -= smallest;
                if (pq[smallest] == 1) pq.Remove(smallest);
                else pq[smallest]--;
                count--;
            }
            if (!pq.ContainsKey(eng[1])) pq[eng[1]] = 0;
            pq[eng[1]]++;
            count++;
            curSum += eng[1];
            ans = Math.Max(ans, curSum * eng[0]);
        }
        
        return (int)(ans % MOD);
    }
}
