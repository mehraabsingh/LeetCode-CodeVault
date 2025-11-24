class Solution {
    public List<Boolean> prefixesDivBy5(int[] nums) {
        List<Boolean> ans = new ArrayList<>();
        int val = 0;
        for (int b : nums) {
            val = ((val << 1) + b) % 5;
            ans.add(val == 0);
        }
        return ans;
    }
}
