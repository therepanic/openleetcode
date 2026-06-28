public class Solution {
    public int OpenLock(string[] deadends, string target) {
        if (target == "0000") return 0;
        var dead = new HashSet<string>(deadends);
        if (dead.Contains("0000")) return -1;
        
        int moves = 0;
        var queue = new Queue<string>();
        var visited = new HashSet<string>();
        queue.Enqueue("0000");
        visited.Add("0000");
        
        while (queue.Count > 0) {
            int size = queue.Count;
            for (int k = 0; k < size; k++) {
                string cur = queue.Dequeue();
                if (cur == target) return moves;
                
                for (int i = 0; i < 4; i++) {
                    int val = cur[i] - '0';
                    int up = (val + 1) % 10;
                    int down = (val - 1 + 10) % 10;
                    
                    char[] arr1 = cur.ToCharArray();
                    arr1[i] = (char)(up + '0');
                    string nxt1 = new string(arr1);
                    
                    char[] arr2 = cur.ToCharArray();
                    arr2[i] = (char)(down + '0');
                    string nxt2 = new string(arr2);
                    
                    if (!dead.Contains(nxt1) && !visited.Contains(nxt1)) {
                        visited.Add(nxt1);
                        queue.Enqueue(nxt1);
                    }
                    if (!dead.Contains(nxt2) && !visited.Contains(nxt2)) {
                        visited.Add(nxt2);
                        queue.Enqueue(nxt2);
                    }
                }
            }
            moves++;
        }
        return -1;
    }
}
