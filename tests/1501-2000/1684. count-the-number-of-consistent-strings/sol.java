class Solution {
    public int countConsistentStrings(String allowed, String[] words) {
        int result = 0;
        java.util.Set<Character> allowedSet = new java.util.HashSet<>();
        for (char c : allowed.toCharArray()) {
            allowedSet.add(c);
        }
        for (String word : words) {
            boolean allIn = true;
            for (char c : word.toCharArray()) {
                if (!allowedSet.contains(c)) {
                    allIn = false;
                    break;
                }
            }
            if (allIn) {
                result++;
            }
        }
        return result;
    }
}
