class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var X = 0
        for op in operations {
            if op.contains("+") {
                X += 1
            } else {
                X -= 1
            }
        }
        return X
    }
}
