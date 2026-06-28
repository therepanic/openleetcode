class Solution {
public:
    string complexNumberMultiply(string num1, string num2) {
        auto parseComplex = [](const string& s) -> pair<int, int> {
            size_t plusPos = s.find('+');
            int real = stoi(s.substr(0, plusPos));
            int imag = stoi(s.substr(plusPos + 1, s.size() - plusPos - 2));
            return {real, imag};
        };
        
        auto [a, b] = parseComplex(num1);
        auto [c, d] = parseComplex(num2);
        int realPart = a * c - b * d;
        int imagPart = a * d + b * c;
        return to_string(realPart) + "+" + to_string(imagPart) + "i";
    }
};
