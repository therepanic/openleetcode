class Solution {
    public int[] sortByBits(int[] arr) {
        Integer[] boxed = Arrays.stream(arr).boxed().toArray(Integer[]::new);
        Arrays.sort(boxed, (a, b) -> {
            int ca = Integer.bitCount(a);
            int cb = Integer.bitCount(b);
            if (ca != cb) return ca - cb;
            return a - b;
        });
        return Arrays.stream(boxed).mapToInt(Integer::intValue).toArray();
    }
}
