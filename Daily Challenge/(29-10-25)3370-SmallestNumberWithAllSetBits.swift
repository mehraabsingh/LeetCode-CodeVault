class Solution {
    func smallestNumber(_ n: Int) -> Int {
        var x = 1
        while x < n {
            x = (x << 1) | 1
        }
        return x
    }
}
