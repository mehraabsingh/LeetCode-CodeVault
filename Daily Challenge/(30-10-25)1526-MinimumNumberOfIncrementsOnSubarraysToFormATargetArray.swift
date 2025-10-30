class Solution {
    func minNumberOperations(_ target: [Int]) -> Int {
        var ops = target[0]
        for i in 1..<target.count {
            if target[i] > target[i - 1] {
                ops += target[i] - target[i - 1]
            }
        }
        return ops
    }
}
