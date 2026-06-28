class Solution {
    public boolean pyramidTransition(String bottom, String[] allowed) {
        return pyramidTransition(bottom, Arrays.asList(allowed));
    }

    public boolean pyramidTransition(String bottom, List<String> allowed) {
        Map<String, Set<Character>> tab = new HashMap<>();
        for (String a : allowed) {
            String key = "" + a.charAt(0) + a.charAt(1);
            tab.computeIfAbsent(key, k -> new HashSet<>()).add(a.charAt(2));
        }
        
        Set<String> visited = new HashSet<>();
        return dfs(bottom, tab, visited);
    }
    
    private boolean dfs(String node, Map<String, Set<Character>> tab, Set<String> visited) {
        if (node.length() == 1) return true;
        if (visited.contains(node)) return false;
        
        List<String> neighbors = getNeighbors(node, tab);
        for (String nxt : neighbors) {
            if (dfs(nxt, tab, visited)) return true;
        }
        
        visited.add(node);
        return false;
    }
    
    private List<String> getNeighbors(String node, Map<String, Set<Character>> tab) {
        List<String> res = new ArrayList<>();
        res.add("");
        
        for (int i = 1; i < node.length(); i++) {
            String key = "" + node.charAt(i-1) + node.charAt(i);
            Set<Character> chars = tab.get(key);
            if (chars == null || chars.isEmpty()) return new ArrayList<>();
            
            List<String> newRes = new ArrayList<>();
            for (String r : res) {
                for (char c : chars) {
                    newRes.add(r + c);
                }
            }
            res = newRes;
        }
        return res;
    }
}
