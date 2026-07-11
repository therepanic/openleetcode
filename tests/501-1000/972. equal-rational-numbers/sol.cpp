class Solution {
public:
    bool isRationalEqual(string s, string t) {
        using ll = long long;
        struct Fraction {
            ll num, den;
            Fraction(ll n, ll d) {
                ll g = gcd(abs(n), abs(d));
                num = n / g;
                den = d / g;
                if (den < 0) { num = -num; den = -den; }
            }
            Fraction operator+(const Fraction& o) const {
                return Fraction(num * o.den + o.num * den, den * o.den);
            }
            bool operator==(const Fraction& o) const {
                return num == o.num && den == o.den;
            }
            ll gcd(ll a, ll b) const {
                while (b) { ll t = b; b = a % b; a = t; }
                return a;
            }
        };

        auto parse = [](const string& x) -> Fraction {
            if (x.find('.') == string::npos) {
                return Fraction(stoll(x), 1);
            }
            auto dotPos = x.find('.');
            string integer = x.substr(0, dotPos);
            string frac = x.substr(dotPos + 1);
            if (frac.find('(') == string::npos) {
                if (frac.empty()) {
                    return Fraction(stoll(integer), 1);
                }
                Fraction base(stoll(integer), 1);
                Fraction fracPart(stoll(frac), (ll)pow(10, frac.length()));
                return base + fracPart;
            }
            auto parenPos = frac.find('(');
            string nonrep = frac.substr(0, parenPos);
            string rep = frac.substr(parenPos + 1, frac.length() - parenPos - 2);
            Fraction base(stoll(integer), 1);
            if (!nonrep.empty()) {
                base = base + Fraction(stoll(nonrep), (ll)pow(10, nonrep.length()));
            }
            ll repeatNum = stoll(rep);
            ll repeatDen = ((ll)pow(10, rep.length()) - 1) * (ll)pow(10, nonrep.length());
            return base + Fraction(repeatNum, repeatDen);
        };

        return parse(s) == parse(t);
    }
};
