#include <queue>
#include <vector>
using namespace std;

class Solution {
public:
    int getNumberOfBacklogOrders(vector<vector<int>>& orders) {
        priority_queue<pair<int, int>> buy;
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> sell;
        for (auto& o : orders) {
            int price = o[0], amount = o[1], type = o[2];
            if (type == 0) {
                while (!sell.empty() && sell.top().first <= price) {
                    auto s = sell.top();
                    sell.pop();
                    if (amount >= s.second) {
                        amount -= s.second;
                    } else {
                        sell.push({s.first, s.second - amount});
                        amount = 0;
                        break;
                    }
                }
            } else {
                while (!buy.empty() && buy.top().first >= price) {
                    auto b = buy.top();
                    buy.pop();
                    if (amount >= b.second) {
                        amount -= b.second;
                    } else {
                        buy.push({b.first, b.second - amount});
                        amount = 0;
                        break;
                    }
                }
            }
            if (amount > 0) {
                if (type == 0) {
                    buy.push({price, amount});
                } else {
                    sell.push({price, amount});
                }
            }
        }
        long long res = 0;
        while (!buy.empty()) { res += buy.top().second; buy.pop(); }
        while (!sell.empty()) { res += sell.top().second; sell.pop(); }
        return res % 1000000007;
    }
};
