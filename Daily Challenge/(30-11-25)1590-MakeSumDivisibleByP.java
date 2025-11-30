class Solution {
    public int minSubarray(int[] nums, int p) {
        long total = 0;
        for (int x : nums) total += x;
        int need = (int)(total % p);
        if (need == 0) return 0;

        HashMap<Integer, Integer> map = new HashMap<>();
        map.put(0, -1);
        long prefix = 0;
        int res = nums.length;

        for (int i = 0; i < nums.length; i++) {
            prefix = (prefix + nums[i]) % p;
            int target = (int)((prefix - need + p) % p);
            if (map.containsKey(target)) {
                res = Math.min(res, i - map.get(target));
            }
            map.put((int)prefix, i);
        }

        return res == nums.length ? -1 : res;
    }
}
