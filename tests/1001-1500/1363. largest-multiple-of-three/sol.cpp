class Solution {
public:
    string largestMultipleOfThree(vector<int>& digits) {
        vector<int> counts(10, 0);
        for (int digit : digits) {
            counts[digit]++;
        }

        int sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += i * counts[i];
        }
        int remainder = sum % 3;

        auto removeSmallest = [&](vector<int> group, int amount) -> bool {
            for (int digit : group) {
                while (amount > 0 && counts[digit] > 0) {
                    counts[digit]--;
                    amount--;
                }
            }
            return amount == 0;
        };

        if (remainder == 1) {
            if (!removeSmallest({1, 4, 7}, 1)) {
                removeSmallest({2, 5, 8}, 2);
            }
        } else if (remainder == 2) {
            if (!removeSmallest({2, 5, 8}, 1)) {
                removeSmallest({1, 4, 7}, 2);
            }
        }

        string result;
        for (int i = 9; i >= 0; i--) {
            result.append(counts[i], '0' + i);
        }
        return result.size() > 0 && result[0] == '0' ? "0" : result;
    }
};
