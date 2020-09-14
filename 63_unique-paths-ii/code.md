# Unique Paths II
# 不同路径 II


## Description
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

Now consider if some obstacles are added to the grids. How many unique paths would there be?

An obstacle and empty space is marked as 1 and 0 respectively in the grid.


## Description
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？

网格中的障碍物和空位置分别用 1 和 0 来表示。




## Example
    Input:
    [
    [0,0,0],
    [0,1,0],
    [0,0,0]
    ]
    Output: 2
    Explanation:
    There is one obstacle in the middle of the 3x3 grid above.
    There are two ways to reach the bottom-right corner:
    1. Right -> Right -> Down -> Down
    2. Down -> Down -> Right -> Right
        

## 样例
    输入:
    [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
    输出: 2
    解释:
    3x3 网格的正中间有一个障碍物。
    从左上角到右下角一共有 2 条不同的路径：
    1. 向右 -> 向右 -> 向下 -> 向下
    2. 向下 -> 向下 -> 向右 -> 向右

## Note
* 1 <= m, n <= 100
* It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.

## 提示
* 1 <= m, n <= 100
* 题目数据保证答案小于等于 2 * 10 ^ 9

## Solution
### 动态规划(dp)
这个题目和我们上一道的类似, 不过我们需要记得对无法到达的位置做额外处理.

### Code

```java
    //T O(mn)
    //S O(mn)
    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        //非空判断
        if (obstacleGrid == null || obstacleGrid.length == 0
                || obstacleGrid[0].length == 0){
            return 0;
        }

        //获取数组边界值
        int row = obstacleGrid.length;
        int col = obstacleGrid[0].length;

        //定义dp数组
        //dp[i][j]的内容代表了从(0,0)的位置开始到(m,n)的位置的路径和
        int[][] dp = new int[row][col];


        //dp数组的初始化
        //获取开始位置信息
        dp[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0;

        //更新首行和首列的信息
        for (int i = 1; i < row && obstacleGrid[i][0] == 0; i++) {
            dp[i][0] = dp[ i - 1 ][0];
        }
        for (int i = 1; i < col && obstacleGrid[i][0] == 0; i++) {
            dp[0][i] = dp[0][ i - 1 ];
        }

        //遍历数组情况
        for (int i = 1; i < row; i++) {
            for (int j = 1; j < col; j++) {
                //判断当前位置能否到达
                //非首行和首列中想要到达当前位置则只能想到达其上方及左侧,
                //所以到达当前路径和为其上方及左方的和
                dp[i][j] = obstacleGrid[i][j] == 0 ?
                        dp[i - 1][j] + dp[i][j - 1]
                        : 0;

            }
        }
        return dp[row - 1][col - 1];
    }

```