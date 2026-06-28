class Solution {
    public String predictPartyVictory(String senate) {
        java.util.Deque<Integer> r = new java.util.ArrayDeque<>();
        java.util.Deque<Integer> d = new java.util.ArrayDeque<>();
        int n = senate.length();
        
        for (int i = 0; i < n; i++) {
            if (senate.charAt(i) == 'R') {
                r.addLast(i);
            } else {
                d.addLast(i);
            }
        }
        
        while (!r.isEmpty() && !d.isEmpty()) {
            int rIdx = r.removeFirst();
            int dIdx = d.removeFirst();
            
            if (rIdx < dIdx) {
                r.addLast(rIdx + n);
            } else {
                d.addLast(dIdx + n);
            }
        }
        
        return r.isEmpty() ? "Dire" : "Radiant";
    }
}
