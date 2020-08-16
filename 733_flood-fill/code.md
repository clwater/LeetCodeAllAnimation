# Flood Fill
# 图像渲染


## Description
An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

At the end, return the modified image.

## Description
有一幅以二维整数数组表示的图画，每一个整数表示该图画的像素值大小，数值在 0 到 65535 之间。

给你一个坐标 (sr, sc) 表示图像渲染开始的像素值（行 ，列）和一个新的颜色值 newColor，让你重新上色这幅图像。

为了完成上色工作，从初始坐标开始，记录初始坐标的上下左右四个方向上像素值与初始坐标相同的相连像素点，接着再记录这四个方向上符合条件的像素点与他们对应四个方向上像素值与初始坐标相同的相连像素点，……，重复该过程。将所有有记录的像素点的颜色值改为新的颜色值。

最后返回经过上色渲染后的图像。


## Example
### Example 1:
    Input: 
    image = [[1,1,1],[1,1,0],[1,0,1]]
    sr = 1, sc = 1, newColor = 2
    Output: [[2,2,2],[2,2,0],[2,0,1]]
    Explanation: 
    From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
    by a path of the same color as the starting pixel are colored with the new color.
    Note the bottom corner is not colored 2, because it is not 4-directionally connected
    to the starting pixel.


## 示例
### 示例 1:
    输入: 
    image = [[1,1,1],[1,1,0],[1,0,1]]
    sr = 1, sc = 1, newColor = 2
    输出: [[2,2,2],[2,2,0],[2,0,1]]
    解析: 
    在图像的正中间，(坐标(sr,sc)=(1,1)),
    在路径上所有符合条件的像素点的颜色都被更改成2。
    注意，右下角的像素没有更改为2，
    因为它不是在上下左右四个方向上与初始点相连的像素点。

## Note:
* The length of image and image[0] will be in the range [1, 50].
* The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
* The value of each color in image[i][j] and newColor will be an integer in [0, 65535].

## 注意:
* image 和 image[0] 的长度在范围 [1, 50] 内。
* 给出的初始点将满足 0 <= sr < image.length 和 0 <= sc < image[0].length。
* image[i][j] 和 newColor 表示的颜色值在范围 [0, 65535]内。


## Solution

### 网格问题+dfs
这里是一个网格系列的问题, 在这里我们可以使用深度优先遍历(dfs)的方式来解决这个问题.

### Code

```java
    
    //需要哪种颜色替换
    private int newColor;
    //需要替换的颜色
    private int changeColor;
    //image数组
    private int[][] image;

    //T O(mn)
    //S O(mn)
    public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
        //初始化相关信息
        this.image = image;
        this.newColor = newColor;
        this.changeColor = image[sr][sc];

        //判断当前颜色是否需要替换
        if (changeColor != newColor) {
            dfs(sr, sc);
        }

        return image;
    }


    //深度优先遍历情况
    private void dfs(int r, int c) {
        //判断当前颜色是否需要替换
        if (image[r][c] == changeColor) {
            //更新当前位置颜色
            image[r][c] = newColor;
            //尝试替换当前位置四周的情况
            if (r >= 1) {
                dfs(r - 1, c);
            }
            if (c >= 1) {
                dfs(r, c - 1);
            }
            if (r + 1 < image.length) {
                dfs(r + 1, c);
            }
            if (c + 1 < image[0].length) {
                dfs(r, c + 1);
            }
        }
    }

```