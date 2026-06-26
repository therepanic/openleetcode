class Solution {
    public String complexNumberMultiply(String num1, String num2) {
        int[] parts1 = parseComplex(num1);
        int[] parts2 = parseComplex(num2);
        int a = parts1[0], b = parts1[1];
        int c = parts2[0], d = parts2[1];
        int realPart = a * c - b * d;
        int imagPart = a * d + b * c;
        return realPart + "+" + imagPart + "i";
    }
    
    private int[] parseComplex(String s) {
        String[] parts = s.split("\\+");
        int real = Integer.parseInt(parts[0]);
        int imag = Integer.parseInt(parts[1].substring(0, parts[1].length() - 1));
        return new int[]{real, imag};
    }
}
