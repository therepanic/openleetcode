class Solution {
public:
    int longestCommonSubpath(int n, vector<vector<int>>& paths) {
        vector<int> combined;
        vector<int> path_origin;
        for (int i = 0; i < paths.size(); i++) {
            for (int v : paths[i]) {
                combined.push_back(v);
                path_origin.push_back(i);
            }
            combined.push_back(-(i + 1));
            path_origin.push_back(i);
        }
        int N = combined.size();
        int M = paths.size();
        vector<int> S = combined;
        vector<int> P_ID = path_origin;

        vector<int> rank(N);
        {
            vector<int> temp = S;
            sort(temp.begin(), temp.end());
            temp.erase(unique(temp.begin(), temp.end()), temp.end());
            for (int i = 0; i < N; i++) {
                rank[i] = lower_bound(temp.begin(), temp.end(), S[i]) - temp.begin();
            }
        }

        int k = 1;
        while (k < N) {
            vector<long long> key(N);
            for (int i = 0; i < N; i++) {
                long long first = rank[i];
                long long second = (i + k < N) ? rank[i + k] + 1 : 0;
                key[i] = (first << 32) | second;
            }
            vector<long long> sorted_key = key;
            sort(sorted_key.begin(), sorted_key.end());
            sorted_key.erase(unique(sorted_key.begin(), sorted_key.end()), sorted_key.end());
            for (int i = 0; i < N; i++) {
                rank[i] = lower_bound(sorted_key.begin(), sorted_key.end(), key[i]) - sorted_key.begin();
            }
            if (k >= N) break;
            k *= 2;
        }

        vector<int> sa(N);
        for (int i = 0; i < N; i++) {
            sa[rank[i]] = i;
        }

        vector<int> lcp(N, 0);
        vector<int> inv_sa = rank;
        int h = 0;
        for (int i = 0; i < N; i++) {
            if (inv_sa[i] > 0) {
                int j = sa[inv_sa[i] - 1];
                while (i + h < N && j + h < N && S[i + h] == S[j + h]) {
                    h++;
                }
                lcp[inv_sa[i]] = h;
                if (h > 0) h--;
            }
        }

        int ans = 0;
        int left = 0;
        vector<int> count(M, 0);
        int distinct_paths = 0;
        deque<int> min_q;

        for (int right = 0; right < N; right++) {
            int p_id = P_ID[sa[right]];
            if (p_id >= 0) {
                if (count[p_id] == 0) distinct_paths++;
                count[p_id]++;
            }
            while (!min_q.empty() && lcp[min_q.back()] >= lcp[right]) {
                min_q.pop_back();
            }
            min_q.push_back(right);

            while (distinct_paths == M) {
                while (!min_q.empty() && min_q.front() <= left) {
                    min_q.pop_front();
                }
                if (!min_q.empty()) {
                    ans = max(ans, lcp[min_q.front()]);
                }
                int out_id = P_ID[sa[left]];
                if (out_id >= 0) {
                    count[out_id]--;
                    if (count[out_id] == 0) distinct_paths--;
                }
                left++;
            }
        }
        return ans;
    }
};
