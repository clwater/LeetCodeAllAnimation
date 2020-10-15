# Unique Paths
# 不同路径


## Description
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?


## Description
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

问总共有多少条不同的路径？


## Example
### Exmaple 1:
    Input: m = 3, n = 2
    Output: 3
    Explanation:
    From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
        1. Right -> Right -> Down
        2. Right -> Down -> Right
        3. Down -> Right -> Right
        
### Example 2:
    Input: m = 7, n = 3
    Output: 28

## 样例
### 样例  1:
    输入: m = 3, n = 2
    输出: 3
    解释:
    从左上角开始，总共有 3 条路径可以到达右下角。
        1. 向右 -> 向右 -> 向下
        2. 向右 -> 向下 -> 向右
        3. 向下 -> 向右 -> 向右

### 样例 2:        
    输入: m = 7, n = 3
    输出: 28

## Note
* 1 <= m, n <= 100
* It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.

## 提示
* 1 <= m, n <= 100
* 题目数据保证答案小于等于 2 * 10 ^ 9

## Solution
### 动态规划(dp)
当我们在解答题目的时候, 我们会尝试绘图来展示题目的情况, 这是一道很经典的动态规划的题目, 这里我们需要定义dp数组, 这里dp[i][j]的内容就可以通过dp[i-1][j]与dp[i][j-1]的和来获得

### Code

```java
    //T O(mn)
    //S O(mn)
    public int uniquePaths(int m, int n) {
        //定义dp数组
        //dp[i][j]的内容代表了从(0,0)的位置开始到(m,n)的位置的路径和
        int[][] dp = new int[m][n];
        //遍历数组情况
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                //首行和首列因为到达的路径是唯一的, 所以都置1
                if (i == 0 || j == 0){
                    dp[i][j] = 1;
                }else {
                    //非首行和首列中想要到达当前位置则只能想到达其上方及左侧,
                    //所以到达当前路径和为其上方及左方的和
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
                }
            }
        }
        //返回dp的右下角信息
        return dp[m - 1][n - 1];
    }
```