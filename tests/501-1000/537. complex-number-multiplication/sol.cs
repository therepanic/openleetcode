public class Solution {
    public string ComplexNumberMultiply(string num1, string num2) {
        (int, int) ParseComplex(string s) {
            string[] parts = s.Split('+');
            int real = int.Parse(parts[0]);
            int imag = int.Parse(parts[1].Substring(0, parts[1].Length - 1));
            return (real, imag);
        }
        
        var (a, b) = ParseComplex(num1);
        var (c, d) = ParseComplex(num2);
        int realPart = a * c - b * d;
        int imagPart = a * d + b * c;
        return $"{realPart}+{imagPart}i";
    }
}
