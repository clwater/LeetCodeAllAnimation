# Best Sightseeing Pair
# 最佳观光组合

## Description
Given an array A of positive integers, A[i] represents the value of the i-th sightseeing spot, and two sightseeing spots i and j have distance j - i between them.

The score of a pair (i < j) of sightseeing spots is (A[i] + A[j] + i - j) : the sum of the values of the sightseeing spots, minus the distance between them.

Return the maximum score of a pair of sightseeing spots.

## Description
给定正整数数组 A，A[i] 表示第 i 个观光景点的评分，并且两个景点 i 和 j 之间的距离为 j - i。

一对景点（i < j）组成的观光组合的得分为（A[i] + A[j] + i - j）：景点的评分之和减去它们两者之间的距离。

返回一对观光景点能取得的最高分。

## Example
### Example 1:
    Input: [8,1,5,2,6]
    Output: 11
    Explanation: i = 0, j = 2, A[i] + A[j] + i - j = 8 + 5 + 0 - 2 = 11

## 示例
### 示例 1：
    输入：[8,1,5,2,6]
    输出：11
    解释：i = 0, j = 2, A[i] + A[j] + i - j = 8 + 5 + 0 - 2 = 11

### Note:
1. 2 <= A.length <= 50000
2. 1 <= A[i] <= 1000

## 提示
1. 2 <= A.length <= 50000
2. 1 <= A[i] <= 1000


## Solution
### 迭代装换
这里我们考虑从前往后枚举j来统计答案，对于每个观光景点j而言, j及A[j]的取值都是不变的, 当前j值下最大的取值就可以理解为寻找A[i]+i的最大值

### Code

```java
    //T O(n)
    //S O(1)
    public int maxScoreSightseeingPair(int[] A) {
        //定义结果情况
        int result = 0;
        //记录前i位中A[i] + i最大值的情况
        int maxI = A[0] + 0;
        //从1位开始遍历查找
        for (int j = 1; j < A.length; j++) {
            //更新当前j位的结果是否为最大
            result = Math.max(result, maxI + A[j] - j);
            //为下次循环准备, 更新前i位中A[i] + i最大值的情况
            maxI = Math.max(maxI, A[j] + j);
        }
        return result;
    }

```