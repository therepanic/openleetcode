class Solution {
    public List<Integer> diffWaysToCompute(String expression) {
        List<Integer> results = new ArrayList<>();
        
        if (expression.matches("\\d+")) {
            results.add(Integer.parseInt(expression));
            return results;
        }
        
        for (int i = 0; i < expression.length(); i++) {
            char c = expression.charAt(i);
            if (c == '+' || c == '-' || c == '*') {
                List<Integer> leftResults = diffWaysToCompute(expression.substring(0, i));
                List<Integer> rightResults = diffWaysToCompute(expression.substring(i + 1));
                
                for (int left : leftResults) {
                    for (int right : rightResults) {
                        if (c == '+') {
                            results.add(left + right);
                        } else if (c == '-') {
                            results.add(left - right);
                        } else if (c == '*') {
                            results.add(left * right);
                        }
                    }
                }
            }
        }
        
        return results;
    }
}
