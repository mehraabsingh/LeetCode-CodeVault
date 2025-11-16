class Solution {
    public int numSub(String s) {
        long count = 0, current = 0, mod = 1000000007;
        for (char c : s.toCharArray()) {
            if (c == '1') current++;
            else {
                count = (count + current * (current + 1) / 2) % mod;
                current = 0;
            }
        }
        count = (count + current * (current + 1) / 2) % mod;
        return (int) count;
    }
}
