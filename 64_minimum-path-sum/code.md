# Minimum Path Sum
# 最小路径和


## Description
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

## Description
给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。



## Example
    Input:
        [
        [1,3,1],
        [1,5,1],
        [4,2,1]
        ]
    Output: 7
    Explanation: Because the path 1→3→1→1→1 minimizes the sum.


## 样例
    输入:
    [
    [1,3,1],
    [1,5,1],
    [4,2,1]
    ]
    输出: 7
    解释: 因为路径 1→3→1→1→1 的总和最小。

## Note
You can only move either down or right at any point in time.

## 说明
每次只能向下或者向右移动一步。

## Solution

### 动态规划(dp)
这是一道很经典的动态规划的题目, 这个题目我们可以看到因为只能向右或向下移动, 所以可以定义一个dp, dp[i][j]表示从grid[0][0]到grid[i][j]最小路径和.


### Code

```java
    //T O(mn)
    //S O(mn)
    public int minPathSum(int[][] grid) {
        //非空校验
        if (grid == null || grid.length == 0 || grid[0].length == 0) {
            return 0;
        }

        //获取边界的情况
        int row = grid.length, col = grid[0].length;

        //定义dp数组
        //dp[i][j]表示从grid[0][0]到grid[i][j]的最小路径和
        int[][] dp = new int[row][col];

        //初始化dp数组的信息
        //左上角为gird数组的信息
        dp[0][0] = grid[0][0];
        //最上方一行和左侧的一行因为只能通过其左侧或者上方的位置移动得到
        //所以其路径和为其之前位置的数字加上其本身的值
        for (int i = 1; i < row; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        for (int j = 1; j < col; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }

        for (int i = 1; i < row; i++) {
            for (int j = 1; j < col; j++) {
                //当前位置可能从其上方或者左侧移动到
                //所以我们要查看到这两个位置的路径和较小的是哪个, 并更新当前位置的路径和
                dp[i][j] = Math.min(
                        dp[i - 1][j],
                        dp[i][j - 1]
                ) + grid[i][j];
            }
        }

        //返回右下角的情况
        return dp[row - 1][col - 1];

    }

```