# Palindrome Removal
# 删除回文子数组

## Description
Given an integer array arr, in one move you can select a palindromic subarray arr[i], arr[i+1], ..., arr[j] where i <= j, and remove that subarray from the given array. Note that after removing a subarray, the elements on the left and on the right of that subarray move to fill the gap left by the removal.

Return the minimum number of moves needed to remove all numbers from the array.

## Description
给你一个整数数组 arr，每一次操作你都可以选择并删除它的一个 回文 子数组 arr[i], arr[i+1], ..., arr[j]（ i <= j）。

注意，每当你删除掉一个子数组，右侧元素都会自行向前移动填补空位。

请你计算并返回从数组中删除所有数字所需的最少操作次数。


## Example
### Example 1:
    Input: arr = [1,2]
    Output: 2

### Example 2:
    Input: arr = [1,3,4,1,5]
    Output: 3
    Explanation: Remove [4] then remove [1,3,1] then remove [5].


## 示例
### 示例 1：
    输入：arr = [1,2]
    输出：2

### 示例 2：
    输入：arr = [1,3,4,1,5]
    输出：3
    解释：先删除 [4]，然后删除 [1,3,1]，最后再删除 [5]。

## 提示：
* 1 <= arr.length <= 100
* 1 <= arr[i] <= 20

## Constraints:
* 1 <= arr.length <= 100
* 1 <= arr[i] <= 20


## Solution
### 动态规划
这道题目中我们使用了动态规划的方法来解决, 这里需要注意我们提供的状态转移公式

### Code

```java
    //T O(n^3)
    //S O(n^2)
    public int minimumMoves(int[] arr) {
        int len = arr.length;

        // 创造一个二维数组, 其中dp[i][j]的值表示为 arr[i][j]的最少删除次数
        int[][] dp = new int[len][len];

        // 初始化字符集
        // 单个字符也是回文串，删除单个字符的最小删除次数就是1
        for (int i = 0; i < len; i ++)
            dp[i][i] = 1;

        //检查相邻两个数字是否相同
        for (int i = 0; i < len - 1; i ++)
            dp[i][i + 1] = arr[i] == arr[i + 1] ? 1 : 2;

        // i为开始点，j为结束点(最小长度为3开始)
        for (int j = 2; j < len; j ++) {
            for (int i = j - 2; i >= 0; i --) {

                // 最差的情况为当前i到j的长度, 当然可以设置为一个很大的值作为临时值
                int min = j - i + 1;

                // 如果当前arr[i]和arr[j]相同, 可以将其简化为dp[i+1][j-1]长度
                if (arr[i] == arr[j])
                    min = dp[i + 1][j - 1];

                // k为i,j之间的的分割点,
                // 我们可以将dp[i][j]的值看做dp[i][k]与dp[k + 1][j]的和
                // 我们通过不断移动k的位置, 寻找是否有dp[i][k]与dp[k + 1][j]的和更小
                for (int k = i; k < j; k ++)
                    min = Math.min(min, dp[i][k] + dp[k + 1][j]);

                dp[i][j] = min;

            }
        }
        return dp[0][len - 1];
    }
```