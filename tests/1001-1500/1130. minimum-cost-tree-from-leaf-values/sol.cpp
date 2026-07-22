class Solution {
public:
    int mctFromLeafValues(vector<int>& arr) {
        int result = 0;
        vector<int> st = {INT_MAX};

        for (int a : arr) {
            while (st.back() <= a) {
                int mid = st.back();
                st.pop_back();
                result += mid * min(st.back(), a);
            }
            st.push_back(a);
        }

        int first = st.back();
        st.pop_back();
        while (st.size() > 1) {
            result += first * st.back();
            first = st.back();
            st.pop_back();
        }

        return result;
    }
};
