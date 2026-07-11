class Solution {
    public String findReplaceString(String s, int[] indices, String[] sources, String[] targets) {
        int n = s.length();
        Map<Integer, String[]> patch = new HashMap<>();
        for (int k = 0; k < indices.length; k++) {
            int i = indices[k];
            String src = sources[k];
            String tgt = targets[k];
            if (i + src.length() <= n && s.substring(i, i + src.length()).equals(src)) {
                patch.put(i, new String[]{src, tgt});
            }
        }
        StringBuilder res = new StringBuilder();
        int i = 0;
        while (i < n) {
            if (patch.containsKey(i)) {
                String[] pair = patch.get(i);
                res.append(pair[1]);
                i += pair[0].length();
            } else {
                res.append(s.charAt(i));
                i++;
            }
        }
        return res.toString();
    }
}
