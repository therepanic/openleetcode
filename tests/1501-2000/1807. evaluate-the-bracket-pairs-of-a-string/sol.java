class Solution {
    public String evaluate(String s, List<List<String>> knowledge) {
        Map<String, String> mp = new HashMap<>();
        for (List<String> pair : knowledge) {
            mp.put(pair.get(0), pair.get(1));
        }
        StringBuilder ans = new StringBuilder();
        int i = 0, n = s.length();
        while (i < n) {
            if (s.charAt(i) == '(') {
                i++;
                StringBuilder temp = new StringBuilder();
                while (i < n && s.charAt(i) != ')') {
                    temp.append(s.charAt(i));
                    i++;
                }
                ans.append(mp.getOrDefault(temp.toString(), "?"));
                i++;
            } else {
                ans.append(s.charAt(i));
                i++;
            }
        }
        return ans.toString();
    }
}
