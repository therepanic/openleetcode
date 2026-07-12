class Solution {
    public boolean canReorderDoubled(int[] arr) {
        Map<Integer, Integer> freq = new HashMap<>();
        for (int i : arr) {
            freq.put(i, freq.getOrDefault(i, 0) + 1);
        }
        
        Integer[] boxed = new Integer[arr.length];
        for (int i = 0; i < arr.length; i++) {
            boxed[i] = arr[i];
        }
        Arrays.sort(boxed, (a, b) -> Integer.compare(Math.abs(a), Math.abs(b)));
        
        for (int val : boxed) {
            if (freq.get(val) == 0) continue;
            int target = val * 2;
            if (freq.containsKey(target) && freq.get(target) > 0) {
                freq.put(val, freq.get(val) - 1);
                freq.put(target, freq.get(target) - 1);
            } else {
                return false;
            }
        }
        return true;
    }
}
