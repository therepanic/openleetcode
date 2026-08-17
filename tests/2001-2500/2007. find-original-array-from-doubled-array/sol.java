class Solution {
    public int[] findOriginalArray(int[] changed) {
        if (changed.length % 2 != 0) return new int[0];
        
        Map<Integer, Integer> count = new HashMap<>();
        for (int num : changed) {
            count.put(num, count.getOrDefault(num, 0) + 1);
        }
        Arrays.sort(changed);
        List<Integer> original = new ArrayList<>();
        
        for (int num : changed) {
            if (count.get(num) == 0) continue;
            if (count.getOrDefault(2 * num, 0) == 0) return new int[0];
            original.add(num);
            count.put(num, count.get(num) - 1);
            count.put(2 * num, count.get(2 * num) - 1);
        }
        
        int[] result = new int[original.size()];
        for (int i = 0; i < original.size(); i++) {
            result[i] = original.get(i);
        }
        return result;
    }
}
