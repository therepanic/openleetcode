class Solution {
    public double[] calcEquation(String[][] equations, float[] values, String[][] queries) {
        Map<String, Map<String, Double>> g = new HashMap<>();
        for (int i = 0; i < equations.length; i++) {
            String a = equations[i][0];
            String b = equations[i][1];
            double v = values[i];
            g.computeIfAbsent(a, k -> new HashMap<>()).put(b, v);
            g.computeIfAbsent(b, k -> new HashMap<>()).put(a, 1.0 / v);
        }
        
        double[] res = new double[queries.length];
        for (int i = 0; i < queries.length; i++) {
            res[i] = dfs(g, queries[i][0], queries[i][1]);
        }
        return res;
    }
    
    private double dfs(Map<String, Map<String, Double>> g, String x, String y) {
        if (!g.containsKey(x) || !g.containsKey(y)) return -1.0;
        if (x.equals(y)) return 1.0;
        Deque<Object[]> s = new ArrayDeque<>();
        Set<String> visited = new HashSet<>();
        s.push(new Object[]{x, 1.0});
        while (!s.isEmpty()) {
            Object[] p = s.pop();
            String c = (String) p[0];
            double r = (Double) p[1];
            if (c.equals(y)) return r;
            visited.add(c);
            for (Map.Entry<String, Double> e : g.get(c).entrySet()) {
                String n = e.getKey();
                if (!visited.contains(n)) {
                    s.push(new Object[]{n, r * e.getValue()});
                }
            }
        }
        return -1.0;
    }
}
