class Solution {
public:
    string validIPAddress(string queryIP) {
        if (count(queryIP.begin(), queryIP.end(), '.') == 3) {
            vector<string> parts;
            stringstream ss(queryIP);
            string part;
            bool valid = true;
            while (getline(ss, part, '.')) {
                parts.push_back(part);
            }
            if (parts.size() != 4) valid = false;
            if (valid) {
                for (const auto& p : parts) {
                    if (p.empty() || p.size() > 3) { valid = false; break; }
                    for (char c : p) if (!isdigit(c)) { valid = false; break; }
                    if (!valid) break;
                    int num = stoi(p);
                    if (num < 0 || num > 255 || to_string(num) != p) { valid = false; break; }
                }
            }
            if (valid) return "IPv4";
        } else if (count(queryIP.begin(), queryIP.end(), ':') == 7) {
            vector<string> parts;
            stringstream ss(queryIP);
            string part;
            bool valid = true;
            while (getline(ss, part, ':')) {
                parts.push_back(part);
            }
            if (parts.size() != 8) valid = false;
            if (valid) {
                for (const auto& p : parts) {
                    if (p.size() < 1 || p.size() > 4) { valid = false; break; }
                    for (char c : p) {
                        if (!isxdigit(c)) { valid = false; break; }
                    }
                    if (!valid) break;
                }
            }
            if (valid) return "IPv6";
        }
        return "Neither";
    }
};
