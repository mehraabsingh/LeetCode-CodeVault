class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var res = 0
        var x = n
        while x > 0 {
            res ^= x
            x >>= 1
        }
        return res
    }
}
