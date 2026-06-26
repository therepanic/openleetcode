class Solution {
    public int distributeCandies(int[] candyType) {
        int n = candyType.length;
        int k = n / 2;
        Set<Integer> set = new HashSet<>();
        for (int candy : candyType) {
            set.add(candy);
        }
        return Math.min(k, set.size());
    }
}
