class Solution {
public:
    string fractionToDecimal(int numerator, int denominator) {
        if (numerator == 0) return "0";
        string result;
        long long n = numerator, d = denominator;
        if ((n < 0) ^ (d < 0)) result += '-';
        n = llabs(n); d = llabs(d);
        result += to_string(n / d);
        long long rem = n % d;
        if (rem == 0) return result;
        result += '.';
        unordered_map<long long, int> seen;
        while (rem != 0) {
            if (seen.count(rem)) {
                result.insert(seen[rem], 1, '(');
                result += ')';
                break;
            }
            seen[rem] = result.size();
            rem *= 10;
            result += to_string(rem / d);
            rem %= d;
        }
        return result;
    }
};
