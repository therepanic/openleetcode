class Solution {
    public int findSpecialInteger(int[] arr) {
        int n = arr.length;
        int q = n / 4;
        Map<Integer, Integer> m = new HashMap<>();
        for (int num : arr) {
            m.put(num, m.getOrDefault(num, 0) + 1);
            if (m.get(num) > q) {
                return num;
            }
        }
        return -1;
    }
}
