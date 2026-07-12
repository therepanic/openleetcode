class Solution {
    public String smallestSubsequence(String s) {
        java.util.Map<Character, Integer> fqMap = new java.util.HashMap<>();
        java.util.Stack<Character> stack = new java.util.Stack<>();
        java.util.Set<Character> visited = new java.util.HashSet<>();
        for (char ch : s.toCharArray()) {
            fqMap.put(ch, fqMap.getOrDefault(ch, 0) + 1);
        }
        for (char ch : s.toCharArray()) {
            fqMap.put(ch, fqMap.get(ch) - 1);
            if (visited.contains(ch)) {
                continue;
            }
            while (!stack.isEmpty() && ch < stack.peek() && fqMap.get(stack.peek()) > 0) {
                visited.remove(stack.pop());
            }
            visited.add(ch);
            stack.push(ch);
        }
        StringBuilder sb = new StringBuilder();
        for (char ch : stack) {
            sb.append(ch);
        }
        return sb.toString();
    }
}
