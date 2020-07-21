# Rotting Oranges
# 腐烂的橘子

## Description
In a given grid, each cell can have one of three values:

* the value 0 representing an empty cell;
* the value 1 representing a fresh orange;
* the value 2 representing a rotten orange.
Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

## Description
在给定的网格中，每个单元格可以有以下三个值之一：

* 值 0 代表空单元格；
* 值 1 代表新鲜橘子；
* 值 2 代表腐烂的橘子。
每分钟，任何与腐烂的橘子（在 4 个正方向上）相邻的新鲜橘子都会腐烂。

返回直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1。



## Example
### Example 1:
    Input: [[2,1,1],[1,1,0],[0,1,1]]
    Output: 4

### Example 2:
    Input: [[2,1,1],[0,1,1],[1,0,1]]
    Output: -1
    Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

### Example 3:
    Input: [[0,2]]
    Output: 0
    Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.


## 样例
### 样例  1:
	输入：[[2,1,1],[1,1,0],[0,1,1]]
    输出：4

### 样例 2:
	输入：[[2,1,1],[0,1,1],[1,0,1]]
    输出：-1
    解释：左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个正向上。


### 样例 3:
	输入：[[0,2]]
    输出：0
    解释：因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。

## Note
1. 1 <= grid.length <= 10
2. 1 <= grid[0].length <= 10
3. grid[i][j] is only 0, 1, or 2.      

## 注意

1. 1 <= grid.length <= 10
2. 1 <= grid[0].length <= 10
3. grid[i][j] 仅为 0、1 或 2



## Solution

### 树的遍历(BFS)
这道题目的话我们先在数组中模拟观察下变化的情况,观察后我们可以把橘子的腐烂过程通过树来表示, 那么这个问题就可以转化为这棵树的深度是多少, 对于最开始多个腐败的橘子的情况, 我们也可以吧这种开始的情况视为某个超级腐烂的橘子感染的, 实际上还是树的遍历情况, 因为要查看剩余健康的橘子的情况, 所以这里采用了BFS的遍历方法.

### Code

```java
    //T O(nm)
    //S O(nm)
    public int orangesRotting(int[][] grid) {

        //获取边界
        int row = grid.length;
        int col = grid[0].length;

        //当前遍历队列
        Queue<int[]> queue = new LinkedList<>();

        //当前剩余新鲜的橘子
        int count = 0;

        //遍历数组
        for (int r = 0; r < row; r++) {
            for (int c = 0; c < col; c++) {
                //统计新鲜橘子的数量
                if (grid[r][c] == 1) {
                    count++;
                    //将腐烂的橘子坐标放入队列中
                } else if (grid[r][c] == 2) {
                    queue.add(new int[]{r, c});
                }
            }
        }

        // result 表示腐烂的轮数，或者分钟数
        int result = 0;

        //如果队列不为空并且新鲜橘子的数量大于0 (队列为空则意味着没有腐烂的橘子可以感染新鲜的橘子了)
        while (count > 0 && !queue.isEmpty()) {
            //BFS层级 + 1
            result++;

            //这里我们感染橘子队列使用的是一个队列
            //我们要再这一层中更新感染的新鲜橘子的数量,
            //所有这里我们记录下当前队列的数量
            int n = queue.size();

            //遍历当前层级的队列
            for (int i = 0; i < n; i++) {

                //进行出队列操作
                int[] orange = queue.poll();

                //获取出队橘子的坐标
                int r = orange[0];
                int c = orange[1];

                //判断上测的橘子能歇感染
                //这里注意数组越界的情况
                //判断上测的位置的是否为新鲜的橘子
                if (r - 1 >= 0 && grid[r - 1][c] == 1) {
                    //将此位置新鲜的橘子感染
                    grid[r - 1][c] = 2;
                    //新鲜橘子的数量减1
                    count--;
                    //将此被感染的橘子入队
                    queue.add(new int[]{r - 1, c});
                }
                //下册橘子
                if (r + 1 < row && grid[r + 1][c] == 1) {
                    grid[r + 1][c] = 2;
                    count--;
                    queue.add(new int[]{r + 1, c});
                }
                //左侧橘子
                if (c - 1 >= 0 && grid[r][c - 1] == 1) {
                    grid[r][c - 1] = 2;
                    count--;
                    queue.add(new int[]{r, c - 1});
                }
                //右侧橘子
                if (c + 1 < col && grid[r][c + 1] == 1) {
                    grid[r][c + 1] = 2;
                    count--;
                    queue.add(new int[]{r, c + 1});
                }
            }
        }

        //判断此时是否还有新鲜的橘子
        if (count > 0) {
            return -1;
        } else {
            return result;
        }
    }
```