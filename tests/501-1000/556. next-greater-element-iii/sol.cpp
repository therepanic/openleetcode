class Solution {
public:
    int nextGreaterElement(int n) {
        string digits = to_string(n);
        int length = digits.size();
        int pivot = -1;

        for (int i = length - 2; i >= 0; i--) {
            if (digits[i] < digits[i + 1]) {
                pivot = i;
                break;
            }
        }

        if (pivot == -1) {
            return -1;
        }

        for (int i = length - 1; i > pivot; i--) {
            if (digits[i] > digits[pivot]) {
                swap(digits[i], digits[pivot]);
                break;
            }
        }

        reverse(digits.begin() + pivot + 1, digits.end());
        long long result = stoll(digits);
        return result <= INT_MAX ? (int)result : -1;
    }
};
