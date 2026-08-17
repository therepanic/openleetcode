import java.util.*;

class Solution {
    private boolean isK(String sub, String t, int k) {
        int count = 0;
        int i = 0;
        for (char ch : t.toCharArray()) {
            if (i < sub.length() && ch == sub.charAt(i)) {
                i++;
                if (i == sub.length()) {
                    i = 0;
                    count++;
                    if (count == k) return true;
                }
            }
        }
        return false;
    }

    public String longestSubsequenceRepeatedK(String s, int k) {
        String res = "";
        Queue<String> q = new LinkedList<>();
        q.offer("");
        while (!q.isEmpty()) {
            String curr = q.poll();
            for (char ch = 'a'; ch <= 'z'; ch++) {
                String nxt = curr + ch;
                if (isK(nxt, s, k)) {
                    res = nxt;
                    q.offer(nxt);
                }
            }
        }
        return res;
    }
}
