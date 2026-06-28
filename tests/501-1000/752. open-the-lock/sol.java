class Solution {
    public int openLock(String[] deadends, String target) {
        if (target.equals("0000")) return 0;
        java.util.Set<String> dead = new java.util.HashSet<>(java.util.Arrays.asList(deadends));
        if (dead.contains("0000")) return -1;
        
        int moves = 0;
        java.util.Queue<String> queue = new java.util.LinkedList<>();
        java.util.Set<String> visited = new java.util.HashSet<>();
        queue.offer("0000");
        visited.add("0000");
        
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int k = 0; k < size; k++) {
                String cur = queue.poll();
                if (cur.equals(target)) return moves;
                
                for (int i = 0; i < 4; i++) {
                    int val = cur.charAt(i) - '0';
                    int up = (val + 1) % 10;
                    int down = (val - 1 + 10) % 10;
                    
                    String nxt1 = cur.substring(0, i) + up + cur.substring(i + 1);
                    String nxt2 = cur.substring(0, i) + down + cur.substring(i + 1);
                    
                    if (!dead.contains(nxt1) && !visited.contains(nxt1)) {
                        visited.add(nxt1);
                        queue.offer(nxt1);
                    }
                    if (!dead.contains(nxt2) && !visited.contains(nxt2)) {
                        visited.add(nxt2);
                        queue.offer(nxt2);
                    }
                }
            }
            moves++;
        }
        return -1;
    }
}
