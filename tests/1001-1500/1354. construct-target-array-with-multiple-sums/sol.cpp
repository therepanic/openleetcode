#include <queue>
#include <numeric>

class Solution {
public:
    bool isPossible(vector<int>& target) {
        priority_queue<long long> heap;
        long long total = 0;
        for (int v : target) {
            heap.push(v);
            total += v;
        }
        while (true) {
            long long largest = heap.top();
            heap.pop();
            long long rest = total - largest;
            if (largest == 1 || rest == 1) {
                return true;
            }
            if (rest == 0 || rest >= largest) {
                return false;
            }
            long long previous = largest % rest;
            if (previous == 0) {
                return false;
            }
            total = rest + previous;
            heap.push(previous);
        }
    }
};
