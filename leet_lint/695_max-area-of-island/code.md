# Max Area of Island
# 岛屿的最大面积

## Description
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

## Description
给定一个包含了一些 0 和 1 的非空二维数组 grid 。

一个 岛屿 是由一些相邻的 1 (代表土地) 构成的组合，这里的「相邻」要求两个 1 必须在水平或者竖直方向上相邻。你可以假设 grid 的四个边缘都被 0（代表水）包围着。

找到给定的二维数组中最大的岛屿面积。(如果没有岛屿，则返回面积为 0 。)


## Example
### Example 1:
    [[0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0],
    [0,0,0,0,0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0,0,0,0]]
    Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.

### Example 2:
    [[0,0,0,0,0,0,0,0]]
    Given the above grid, return 0.


## 样例
### 示例 1:
    [[0,0,1,0,0,0,0,1,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,1,1,0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,1,0,0,1,0,1,0,0],
    [0,1,0,0,1,1,0,0,1,1,1,0,0],
    [0,0,0,0,0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,0,0,0,0]]
    对于上面这个给定矩阵应返回 6。注意答案不应该是 11 ，因为岛屿只能包含水平或垂直的四个方向的 1 。

### 示例 2:
    [[0,0,0,0,0,0,0,0]]
    对于上面这个给定的矩阵, 返回 0。

 

## Note
Note: The length of each dimension in the given grid does not exceed 50. 

## 注意
给定的矩阵grid 的长度和宽度都不超过 50。


## Solution
### 网格问题+dfs
网格问题, 老生常谈的问题了, 这里我们可以通过在解决岛屿数量的基础上增加对岛屿面积的计算

### Code

```java
       //全局定义当前数组
    private int[][] grid;

    //T O(mn)
    //S O(mn)
    public int maxAreaOfIsland(int[][] grid) {
        //检查边界值
        if (grid == null || grid.length == 0) {
            return 0;
        }
        //更新数组内容
        this.grid = grid;

        int result = 0;

        //依次遍历查找岛屿的信息
        for (int r = 0; r < grid.length; r++) {
            for (int c = 0; c < grid[0].length; c++) {
                //遇到一个新的陆地, 计算寻找这个岛屿的面积并查看是否为当前最大岛屿
                if (grid[r][c] == 1) {
                    result = Math.max(result, dfs(r, c));
                }
            }
        }

        return result;
    }

    private int dfs(int r, int c) {
        //如果当前为边界
        //或者当前为水域(一直都是水域或其它的岛屿统计完成后将其置为水域)
        //则此方向的岛屿面积为0
        if (r < 0 || c < 0 || r >= grid.length || c >= grid[0].length || grid[r][c] == 0) {
            return 0;
        }

        //表示当前已经统计过
        grid[r][c] = 0;

        //当前陆地和四个方向的岛屿和为此岛屿的面积
        return 1 + dfs(r - 1, c) +
                dfs(r + 1, c) +
                dfs(r, c - 1) +
                dfs(r, c + 1);


    }
```