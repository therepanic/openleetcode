class Solution {
    public int[] findDiagonalOrder(int[][] nums) {
        List<List<Integer>> rows = new ArrayList<>();
        for (int[] row : nums) {
            List<Integer> values = new ArrayList<>(row.length);
            for (int value : row) {
                values.add(value);
            }
            rows.add(values);
        }
        return findDiagonalOrder(rows);
    }

    public int[] findDiagonalOrder(List<List<Integer>> nums) {
        List<int[]> l = new ArrayList<>();
        for (int i = 0; i < nums.size(); i++) {
            List<Integer> row = nums.get(i);
            for (int j = 0; j < row.size(); j++) {
                l.add(new int[]{i + j, i, j});
            }
        }

        Map<Integer, List<Integer>> h = new HashMap<>();
        for (int[] triple : l) {
            int key = triple[0];
            int val = nums.get(triple[1]).get(triple[2]);
            h.computeIfAbsent(key, k -> new ArrayList<>()).add(val);
        }

        List<Integer> sortedKeys = new ArrayList<>(h.keySet());
        Collections.sort(sortedKeys);
        
        List<Integer> resultList = new ArrayList<>();
        for (int key : sortedKeys) {
            List<Integer> diag = h.get(key);
            for (int k = diag.size() - 1; k >= 0; k--) {
                resultList.add(diag.get(k));
            }
        }
        
        int[] res = new int[resultList.size()];
        for (int i = 0; i < resultList.size(); i++) {
            res[i] = resultList.get(i);
        }
        return res;
    }
}
