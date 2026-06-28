class Solution {
public:
    int scheduleCourse(vector<vector<int>>& courses) {
        sort(courses.begin(), courses.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] == b[1] ? a[0] < b[0] : a[1] < b[1];
        });
        priority_queue<int> heap;
        int days = 0;
        for (const auto& course : courses) {
            int duration = course[0];
            int last = course[1];
            days += duration;
            heap.push(duration);
            if (days > last) {
                int top = heap.top();
                heap.pop();
                days -= top;
            }
        }
        return heap.size();
    }
};
