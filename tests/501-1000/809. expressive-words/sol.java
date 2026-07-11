class Solution {
    public int expressiveWords(String s, String[] words) {
        Object[] sEncoded = encode(s);
        char[] sChars = (char[]) sEncoded[0];
        int[] sCnts = (int[]) sEncoded[1];
        int ans = 0;
        for (String w : words) {
            Object[] wEncoded = encode(w);
            char[] wChars = (char[]) wEncoded[0];
            int[] wCnts = (int[]) wEncoded[1];
            if (!java.util.Arrays.equals(sChars, wChars)) continue;
            boolean ok = true;
            for (int i = 0; i < sCnts.length; i++) {
                int sc = sCnts[i], wc = wCnts[i];
                if (sc < wc || (sc < 3 && sc != wc)) {
                    ok = false;
                    break;
                }
            }
            if (ok) ans++;
        }
        return ans;
    }
    
    private Object[] encode(String x) {
        StringBuilder chars = new StringBuilder();
        java.util.ArrayList<Integer> cnts = new java.util.ArrayList<>();
        char prev = 0;
        int c = 0;
        for (char ch : x.toCharArray()) {
            if (ch == prev) {
                c++;
            } else {
                if (prev != 0) {
                    chars.append(prev);
                    cnts.add(c);
                }
                prev = ch;
                c = 1;
            }
        }
        if (prev != 0) {
            chars.append(prev);
            cnts.add(c);
        }
        return new Object[]{chars.toString().toCharArray(), cnts.stream().mapToInt(i -> i).toArray()};
    }
}
