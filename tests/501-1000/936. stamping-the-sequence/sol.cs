public class Solution {
    public int[] MovesToStamp(string stamp, string target) {
        int m = stamp.Length;
        int n = target.Length;
        char[] stampArr = stamp.ToCharArray();
        char[] targetArr = target.ToCharArray();
        
        bool CanStamp(int i) {
            for (int j = 0; j < m; j++) {
                if (targetArr[i + j] != '?' && targetArr[i + j] != stampArr[j]) {
                    return false;
                }
            }
            return true;
        }
        
        void ApplyStamp(int i) {
            for (int j = 0; j < m; j++) {
                targetArr[i + j] = '?';
            }
        }
        
        bool[] stamped = new bool[n];
        List<int> result = new List<int>();
        Queue<int> queue = new Queue<int>();
        
        for (int i = 0; i <= n - m; i++) {
            if (CanStamp(i)) {
                ApplyStamp(i);
                queue.Enqueue(i);
                result.Add(i);
                stamped[i] = true;
            }
        }
        
        while (queue.Count > 0) {
            int pos = queue.Dequeue();
            int start = Math.Max(0, pos - m + 1);
            int end = Math.Min(n - m, pos + m);
            for (int i = start; i <= end; i++) {
                if (CanStamp(i)) {
                    if (!stamped[i]) {
                        ApplyStamp(i);
                        queue.Enqueue(i);
                        result.Add(i);
                        stamped[i] = true;
                    }
                }
            }
        }
        
        foreach (char c in targetArr) {
            if (c != '?') {
                return new int[0];
            }
        }
        
        result.Reverse();
        return result.ToArray();
    }
}
