class Solution {
    public String smallestEquivalentString(String s1, String s2, String baseStr) {
        Map<Character, List<Character>> adj = new HashMap<>();
        for (int i = 0; i < s1.length(); i++) {
            char a = s1.charAt(i);
            char b = s2.charAt(i);
            adj.computeIfAbsent(a, k -> new ArrayList<>()).add(b);
            adj.computeIfAbsent(b, k -> new ArrayList<>()).add(a);
        }

        StringBuilder result = new StringBuilder();
        for (char ch : baseStr.toCharArray()) {
            Set<Character> visited = new HashSet<>();
            result.append(dfs(ch, visited, adj));
        }
        return result.toString();
    }

    private char dfs(char ch, Set<Character> visited, Map<Character, List<Character>> adj) {
        visited.add(ch);
        char minCh = ch;
        for (char nei : adj.getOrDefault(ch, new ArrayList<>())) {
            if (!visited.contains(nei)) {
                char candidate = dfs(nei, visited, adj);
                if (candidate < minCh) minCh = candidate;
            }
        }
        return minCh;
    }
}
