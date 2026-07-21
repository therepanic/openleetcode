class Solution {
    public int minSteps(String s, String t) {
        java.util.Map<Character, Integer> dic = new java.util.HashMap<>();
        for (char ch : t.toCharArray()) {
            dic.put(ch, dic.getOrDefault(ch, 0) + 1);
        }
        for (char ch : s.toCharArray()) {
            if (dic.containsKey(ch) && dic.get(ch) > 0) {
                dic.put(ch, dic.get(ch) - 1);
            }
        }
        int sum = 0;
        for (int val : dic.values()) {
            sum += val;
        }
        return sum;
    }
}
