class Solution {
    public int maxRepeating(String sequence, String word) {
        String temp = word;
        int res = 0;
        while (sequence.contains(temp)) {
            res++;
            temp += word;
        }
        return res;
    }
}
