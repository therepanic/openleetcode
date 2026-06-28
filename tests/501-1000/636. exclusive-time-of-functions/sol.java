class Solution {
    public int[] exclusiveTime(int n, String[] logs) {
        Stack<int[]> callstack = new Stack<>();
        int[] exectime = new int[n];
        
        for (String log : logs) {
            String[] parts = log.split(":");
            int idn = Integer.parseInt(parts[0]);
            String status = parts[1];
            int curtime = Integer.parseInt(parts[2]);
            
            if (status.equals("start")) {
                callstack.push(new int[]{idn, curtime});
            } else {
                int[] top = callstack.pop();
                int x = top[0];
                int y = top[1];
                int time = curtime - y + 1;
                exectime[x] += time;
                if (!callstack.isEmpty()) {
                    x = callstack.peek()[0];
                    exectime[x] -= time;
                }
            }
        }
        
        return exectime;
    }
}
