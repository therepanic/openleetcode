class Solution {
    public String solveEquation(String equation) {
        String[] parts = equation.split("=");
        int[] left = parseSide(parts[0]);
        int[] right = parseSide(parts[1]);
        
        int coeff = left[0] - right[0];
        int constant = right[1] - left[1];
        
        if (coeff == 0) {
            return constant != 0 ? "No solution" : "Infinite solutions";
        }
        return "x=" + (constant / coeff);
    }
    
    private int[] parseSide(String side) {
        int coeff = 0;
        int constant = 0;
        StringBuilder num = new StringBuilder();
        int sign = 1;
        side += '+';
        
        for (char c : side.toCharArray()) {
            if (c == '+' || c == '-') {
                if (num.length() > 0) {
                    constant += sign * Integer.parseInt(num.toString());
                    num.setLength(0);
                }
                sign = c == '+' ? 1 : -1;
            } else if (Character.isDigit(c)) {
                num.append(c);
            } else if (c == 'x') {
                coeff += sign * (num.length() > 0 ? Integer.parseInt(num.toString()) : 1);
                num.setLength(0);
            }
        }
        return new int[]{coeff, constant};
    }
}
