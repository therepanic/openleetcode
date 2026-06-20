public class Solution {
    public bool IsValidSerialization(string preorder) {
        int slots = 1;
        foreach (string node in preorder.Split(',')) {
            slots--;
            if (slots < 0) return false;
            if (node != "#") slots += 2;
        }
        return slots == 0;
    }
}
