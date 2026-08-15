class Solution {
    public int[] recoverArray(int n, int[] sums) {
        Arrays.sort(sums);
        int[] res = new int[n];
        
        for (int i = 0; i < n; i++) {
            int d = sums[1] - sums[0];
            
            List<Integer> left = new ArrayList<>();
            List<Integer> right = new ArrayList<>();
            Map<Integer, Integer> count = new HashMap<>();
            for (int s : sums) count.put(s, count.getOrDefault(s, 0) + 1);
            
            for (int s : sums) {
                if (count.get(s) > 0) {
                    left.add(s);
                    right.add(s + d);
                    count.put(s, count.get(s) - 1);
                    count.put(s + d, count.getOrDefault(s + d, 0) - 1);
                }
            }
            
            boolean hasZero = left.contains(0);
            if (hasZero) {
                res[i] = d;
                sums = left.stream().mapToInt(Integer::intValue).toArray();
            } else {
                res[i] = -d;
                sums = right.stream().mapToInt(Integer::intValue).toArray();
            }
        }
        return res;
    }
}
