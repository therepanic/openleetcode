class Solution {
public:
    bool reorderedPowerOf2(int n) {
        auto signature = [](int num) {
            array<int, 10> counts{};
            if (num == 0) {
                counts[0] = 1;
            } else {
                while (num > 0) {
                    counts[num % 10]++;
                    num /= 10;
                }
            }
            string s;
            for (int count : counts) {
                s.push_back('#');
                s += to_string(count);
            }
            return s;
        };

        string target = signature(n);
        for (int i = 0; i < 31; i++) {
            if (signature(1 << i) == target) {
                return true;
            }
        }
        return false;
    }
};
