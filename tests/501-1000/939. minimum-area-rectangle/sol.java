class Solution {
    public int minAreaRect(int[][] points) {
        Map<Integer, List<Integer>> cols = new HashMap<>();
        for (int[] point : points) {
            int x = point[0], y = point[1];
            cols.computeIfAbsent(x, k -> new ArrayList<>()).add(y);
        }
        
        Map<String, Integer> lastX = new HashMap<>();
        int best = Integer.MAX_VALUE;
        List<Integer> sortedX = new ArrayList<>(cols.keySet());
        Collections.sort(sortedX);
        
        for (int x : sortedX) {
            List<Integer> ys = cols.get(x);
            Collections.sort(ys);
            for (int i = 0; i < ys.size(); i++) {
                for (int j = i + 1; j < ys.size(); j++) {
                    String pair = ys.get(i) + "," + ys.get(j);
                    if (lastX.containsKey(pair)) {
                        int area = (x - lastX.get(pair)) * (ys.get(j) - ys.get(i));
                        best = Math.min(best, area);
                    }
                    lastX.put(pair, x);
                }
            }
        }
        return best == Integer.MAX_VALUE ? 0 : best;
    }
}
