# Minimum Increment to Make Array Unique
# 使数组唯一的最小增量

## Description
Given an array of integers A, a move consists of choosing any A[i], and incrementing it by 1.

Return the least number of moves to make every value in A unique.

## Description
给定整数数组 A，每次 move 操作将会选择任意 A[i]，并将其递增 1。

返回使 A 中的每个值都是唯一的最少操作次数。

## Example
### Example 1:
    Input: [1,2,2]
    Output: 1
    Explanation:  After 1 move, the array could be [1, 2, 3].

### Example 2:
    Input: [3,2,1,2,1,7]
    Output: 6
    Explanation:  After 6 moves, the array could be [3, 4, 1, 2, 5, 7].
    It can be shown with 5 or less moves that it is impossible for the array to have all unique values.

## 样例
### 示例 1:
    输入：[1,2,2]
    输出：1
    解释：经过一次 move 操作，数组将变为 [1, 2, 3]。

### 示例 2:
    输入：[3,2,1,2,1,7]
    输出：6
    解释：经过 6 次 move 操作，数组将变为 [3, 4, 1, 2, 5, 7]。
    可以看出 5 次或 5 次以下的 move 操作是不能让数组的每个值唯一的。

## Constraints:
1. 0 <= A.length <= 40000
2. 0 <= A[i] < 40000

## 提示：
1. 0 <= A.length <= 40000
2. 0 <= A[i] < 40000

## Solution
### 计数+排序
这道题目比较简单, 我们可以使用计数和排序两种方法来解决

### Code

```java
    //排序
    //T O(n * log(n))
    //S O(1)
   public int minIncrementForUnique(int[] A) {
        Arrays.sort(A); // 先排序
        int result = 0;
        for (int i = 1; i < A.length; i++) {
            if (A[i - 1] >= A[i]){
                result += A[i - 1] + 1 - A[i];
                A[i] = A[i - 1] + 1;
            }
        }
        return result;
    }

    //计数
    //T O(n + k)
    //S O(n)
    public int minIncrementForUnique(int[] A) {
        int[] count = new int[40000];
        int max = 0;
        for (int index : A) {
            count[index]++; // 计数
            max = Math.max(max, index); // 计算数组中的最大值
        }

        int result = 0;
        for (int i = 0; i < max; i++) {
            if (count[i] > 1) {
                // 有 count[j] - 1 个数需要增加
                result += count[i] - 1;
                count[i + 1] += count[i] - 1;
            }
        }

        // count[max] 单独计算，是因为可能超出 40000 的边界
        if (count[max] > 1) {
            int d = count[max] - 1;
            // 有 d 个数需要增加
            // 分别增加为 max + 1, max + 2, ... max + d
            // 使用等差数列公式求和
            result += (1 + d) * d / 2;
        }

        return result;

    }
```