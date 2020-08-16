# Island Perimeter
# 岛屿的周长


## Description
You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

## Description
给定一个包含 0 和 1 的二维网格地图，其中 1 表示陆地 0 表示水域。

网格中的格子水平和垂直方向相连（对角线方向不相连）。整个网格被水完全包围，但其中恰好有一个岛屿（或者说，一个或多个表示陆地的格子相连组成的岛屿）。

岛屿中没有“湖”（“湖” 指水域在岛屿内部且不和岛屿周围的水相连）。格子是边长为 1 的正方形。网格为长方形，且宽度和高度均不超过 100 。计算这个岛屿的周长。



## Example
### Example 1:
    Input:
    [[0,1,0,0],
    [1,1,1,0],
    [0,1,0,0],
    [1,1,0,0]]

    Output: 16

   

## 示例
### 示例 1:
    输入:
    [[0,1,0,0],
    [1,1,1,0],
    [0,1,0,0],
    [1,1,0,0]]

    输出: 16

    




## Solution
### 网格问题+dfs
同样是一个网格问题, 这里我们依然采用dfs的方式来遍历网格信息, 这里我们需要注意边界的问题, 由于边界的存在, 我们需要使用原地数组处理额外的遍历信息.

### Code

```java
    private int[][] grid;

    //T O(mn)
    //S O(mn)
    public int islandPerimeter(int[][] grid) {
        this.grid = grid;
        //题目限制, 当前数组中最多存在一个岛屿, 这里我们寻找到任意一个陆地部分, 查看当前唯一岛屿的信息即可
        for (int r = 0; r < grid.length; r++) {
            for (int c = 0; c < grid[0].length; c++) {
                if (grid[r][c] == 1) {
                    return dfs(r, c);
                }
            }
        }
        //默认返回0, 当前不存在岛屿
        return 0;
    }

    private int dfs(int r, int c) {
        //判断是否为边界, 如果为边界则岛屿的边界长度+1
        if (!(0 <= r && r < grid.length && 0 <= c && c < grid[0].length)) {
            return 1;
        }
        //判断是否为水域, 如果是水域则则岛屿的边界长度+1
        if (grid[r][c] == 0) {
            return 1;
        }

        //判断当前陆地是否已经计算过, 如果计算过测跳过此方向
        if (grid[r][c] == 2) {
            return 0;
        }

        //记录当前位置已被计算
        grid[r][c] = 2;

        //获取其四个方向的边界信息
        return dfs(r - 1, c)
                + dfs(r + 1, c)
                + dfs(r, c - 1)
                + dfs(r, c + 1);
    }
```