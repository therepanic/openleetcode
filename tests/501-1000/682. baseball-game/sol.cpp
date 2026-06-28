class Solution {
public:
    int calPoints(vector<string>& operations) {
        vector<int> stack;
        for (const string& op : operations) {
            if (op == "C") {
                stack.pop_back();
            } else if (op == "D") {
                stack.push_back(stack.back() * 2);
            } else if (op == "+") {
                stack.push_back(stack.back() + stack[stack.size() - 2]);
            } else {
                stack.push_back(stoi(op));
            }
        }
        int sum = 0;
        for (int v : stack) sum += v;
        return sum;
    }
};
