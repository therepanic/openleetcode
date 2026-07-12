class Solution {
    public int numSpecialEquivGroups(String[] words) {
        Set<String> seen = new HashSet<>();
        for (String w : words) {
            int n = w.length();
            StringBuilder evenBuilder = new StringBuilder();
            StringBuilder oddBuilder = new StringBuilder();
            for (int i = 0; i < n; i++) {
                if (i % 2 == 0) {
                    evenBuilder.append(w.charAt(i));
                } else {
                    oddBuilder.append(w.charAt(i));
                }
            }
            char[] even = evenBuilder.toString().toCharArray();
            char[] odd = oddBuilder.toString().toCharArray();
            Arrays.sort(even);
            Arrays.sort(odd);
            seen.add(new String(even) + "," + new String(odd));
        }
        return seen.size();
    }
}
