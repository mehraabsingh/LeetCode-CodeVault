/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left),
 * right(right) {}
 * };
 */
class Solution {
public:
    void getPath(TreeNode *cur, int targetValue, string &path, string &ans) {
        if (!cur)
            return;
        if (cur->val == targetValue)
            ans = path;
        path.push_back('L');
        getPath(cur->left, targetValue, path, ans);
        path.back() = 'R';
        getPath(cur->right, targetValue, path, ans);
        path.pop_back();
    }

    string getDirections(TreeNode *root, int startValue, int destValue) {
        string tmpPath, startPath, destPath;
        getPath(root, startValue, tmpPath, startPath);
        getPath(root, destValue, tmpPath, destPath);
        // Find the first point at which the paths diverge
        auto [itr1, itr2] = mismatch(startPath.begin(), startPath.end(),
                                     destPath.begin(), destPath.end());
        return string(startPath.end() - itr1, 'U') +
               string(itr2, destPath.end());
    }
};
