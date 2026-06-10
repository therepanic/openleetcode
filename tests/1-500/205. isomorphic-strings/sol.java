public class Solution {
    public boolean isIsomorphic(String s, String t) {
        int[] st = new int[256];
        int[] ts = new int[256];
        java.util.Arrays.fill(st, -1);
        java.util.Arrays.fill(ts, -1);
        for (int i = 0; i < s.length(); i++) {
            int a = s.charAt(i), b = t.charAt(i);
            if (st[a] != ts[b]) return false;
            st[a] = ts[b] = i;
        }
        return true;
    }
}
