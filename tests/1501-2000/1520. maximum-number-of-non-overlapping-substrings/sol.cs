public class Solution {
    public IList<string> MaxNumOfSubstrings(string s) {
        int n = s.Length;
        var counts = new Dictionary<char, int>();
        foreach (char c in s) {
            counts[c] = counts.GetValueOrDefault(c) + 1;
        }
        var first = new Dictionary<char, int>();
        var last = new Dictionary<char, int>();
        foreach (var k in counts.Keys) {
            first[k] = s.IndexOf(k);
            last[k] = s.LastIndexOf(k);
        }
        
        var res = new List<string>();
        var queue = new LinkedList<int[]>();
        
        foreach (var k in counts.Keys) {
            queue.AddFirst(new int[] {first[k], last[k], counts[k]});
            int left = int.MaxValue;
            int right = int.MinValue;
            int total = 0;
            
            foreach (var arr in queue) {
                total += arr[2];
                left = Math.Min(left, arr[0]);
                right = Math.Max(right, arr[1]);
                if (total == right - left + 1) break;
            }
            
            if (total == right - left + 1) {
                res.Add(s.Substring(left, right - left + 1));
                queue.Clear();
            }
        }
        
        return res;
    }
}
