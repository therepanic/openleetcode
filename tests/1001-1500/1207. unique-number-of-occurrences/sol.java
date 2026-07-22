class Solution {
    public boolean uniqueOccurrences(int[] arr) {
        java.util.Map<Integer, Integer> d = new java.util.HashMap<>();
        for (int i : arr) {
            if (d.containsKey(i)) {
                d.put(i, d.get(i) + 1);
            } else {
                d.put(i, 1);
            }
        }
        java.util.Set<Integer> s = new java.util.HashSet<>();
        for (int value : d.values()) {
            if (s.contains(value)) {
                return false;
            }
            s.add(value);
        }
        return true;
    }
}
