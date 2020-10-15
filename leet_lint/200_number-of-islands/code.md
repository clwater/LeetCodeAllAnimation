# Number of Islands
# 岛屿数量


## Description
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

## Description
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。



## Example
### Example 1:
    Input: grid = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
    ]
    Output: 1

### Example 2:
    Input: grid = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
    ]
    Output: 3


## 示例
### 示例 1:
    输入:
    [
    ['1','1','1','1','0'],
    ['1','1','0','1','0'],
    ['1','1','0','0','0'],
    ['0','0','0','0','0']
    ]
    输出: 1

### 示例 2:
    输入:
    [
    ['1','1','0','0','0'],
    ['1','1','0','0','0'],
    ['0','0','1','0','0'],
    ['0','0','0','1','1']
    ]
    输出: 3
    解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。



## Solution
### 网格问题+dfs
很典型的一个网格问题, 这里我们依然采用dfs的方式来遍历网格信息, 在
这里我们依然使用原地处理的方法来解决岛屿处理过的状态.

### Code

```java
    //全局定义当前数组
    private char[][] grid;

    //T O(mn)
    //S O(mn)
    public int numIslands(char[][] grid) {
        //检查边界值
        if (grid == null || grid.length == 0) {
            return 0;
        }
        //更新数组内容
        this.grid = grid;

        int result = 0;

        //依次遍历查找岛屿的信息
        for (int r = 0; r < grid.length; ++r) {
            for (int c = 0; c < grid[0].length; ++c) {
                //遇到一个新的陆地, 尝试寻找这个陆地的所有位置
                if (grid[r][c] == '1') {
                    result++;
                    dfs(r, c);
                }
            }
        }

        return result;
    }


    private void dfs(int r, int c) {
        //如果当前为边界
        //或者当前为水域(一直都是水域或其它的岛屿统计完成后将其置为水域)
        if (r < 0 || c < 0 || r >= grid.length || c >= grid[0].length
                || grid[r][c] == '0') {
            return;
        }


        //表示当前已经统计过
        grid[r][c] = '0';

        //尝试标记其四个方位是否为岛屿
        dfs(r - 1, c);
        dfs(r + 1, c);
        dfs(r, c - 1);
        dfs(r, c + 1);
    }
```