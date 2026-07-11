class Solution {
    public List<Boolean> camelMatch(String[] queries, String pattern) {
        List<Boolean> ans = new ArrayList<>();
        for (String query : queries) {
            int j = 0;
            int i = 0;
            while (i < query.length()) {
                if (Character.isUpperCase(query.charAt(i)) && ((j < pattern.length() && query.charAt(i) != pattern.charAt(j)) || j > pattern.length() - 1)) {
                    break;
                }
                if (j < pattern.length() && query.charAt(i) == pattern.charAt(j)) {
                    j++;
                }
                i++;
            }
            if (i == query.length() && j == pattern.length()) {
                ans.add(true);
            } else {
                ans.add(false);
            }
        }
        return ans;
    }
}
