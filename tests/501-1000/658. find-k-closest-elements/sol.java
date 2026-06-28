class Solution {
    public List<Integer> findClosestElements(int[] arr, int k, int x) {
        List<Integer> list = new ArrayList<>();
        for (int num : arr) list.add(num);
        Collections.sort(list, (a, b) -> {
            int diff = Math.abs(a - x) - Math.abs(b - x);
            if (diff != 0) return diff;
            return a - b;
        });
        List<Integer> result = list.subList(0, k);
        Collections.sort(result);
        return result;
    }
}
