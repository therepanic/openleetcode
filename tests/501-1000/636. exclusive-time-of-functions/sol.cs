public class Solution {
    public int[] ExclusiveTime(int n, IList<string> logs) {
        Stack<int[]> callstack = new Stack<int[]>();
        int[] exectime = new int[n];
        
        foreach (string log in logs) {
            string[] parts = log.Split(':');
            int idn = int.Parse(parts[0]);
            string status = parts[1];
            int curtime = int.Parse(parts[2]);
            
            if (status == "start") {
                callstack.Push(new int[] { idn, curtime });
            } else {
                int[] top = callstack.Pop();
                int x = top[0];
                int y = top[1];
                int time = curtime - y + 1;
                exectime[x] += time;
                if (callstack.Count > 0) {
                    x = callstack.Peek()[0];
                    exectime[x] -= time;
                }
            }
        }
        
        return exectime;
    }
}
