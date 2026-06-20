#include <vector>
#include <queue>
#include <unordered_map>

using namespace std;

class DualHeap {
public:
    priority_queue<int> small;
    priority_queue<int, vector<int>, greater<int>> large;
    unordered_map<int, int> delayed;
    int k;
    int smallSize = 0;
    int largeSize = 0;

    DualHeap(int k) : k(k) {}

    void pruneSmall() {
        while (!small.empty()) {
            int num = small.top();
            if (delayed[num] == 0) break;
            delayed[num]--;
            if (delayed[num] == 0) delayed.erase(num);
            small.pop();
        }
    }

    void pruneLarge() {
        while (!large.empty()) {
            int num = large.top();
            if (delayed[num] == 0) break;
            delayed[num]--;
            if (delayed[num] == 0) delayed.erase(num);
            large.pop();
        }
    }

    void makeBalance() {
        if (smallSize > largeSize + 1) {
            large.push(small.top()); small.pop();
            smallSize--; largeSize++;
            pruneSmall();
        } else if (smallSize < largeSize) {
            small.push(large.top()); large.pop();
            smallSize++; largeSize--;
            pruneLarge();
        }
    }

    void insert(int num) {
        if (small.empty() || num <= small.top()) {
            small.push(num); smallSize++;
        } else {
            large.push(num); largeSize++;
        }
        makeBalance();
    }

    void erase(int num) {
        delayed[num]++;
        if (num <= small.top()) {
            smallSize--;
            if (num == small.top()) pruneSmall();
        } else {
            largeSize--;
            if (!large.empty() && num == large.top()) pruneLarge();
        }
        makeBalance();
    }

    double median() {
        if (k % 2 == 1) return small.top();
        return ((double)small.top() + large.top()) / 2.0;
    }
};

class Solution {
public:
    vector<double> medianSlidingWindow(vector<int>& nums, int k) {
        DualHeap dh(k);
        for (int i = 0; i < k; i++) dh.insert(nums[i]);
        vector<double> ans;
        ans.push_back(dh.median());
        for (int i = k; i < nums.size(); i++) {
            dh.insert(nums[i]);
            dh.erase(nums[i - k]);
            ans.push_back(dh.median());
        }
        return ans;
    }
};
