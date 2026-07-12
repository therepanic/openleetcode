class Solution {
    public List<Integer> powerfulIntegers(int x, int y, int bound) {
        Set<Integer> result = new HashSet<>();
        int i = 1;

        while (i <= bound) {
            int j = 1;
            while (i + j <= bound) {
                result.add(i + j);
                if (y == 1) break;
                j *= y;
            }
            if (x == 1) break;
            i *= x;
        }
        
        return new ArrayList<>(result);
    }
}
