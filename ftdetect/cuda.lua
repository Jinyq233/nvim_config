-- ftdetect/cuda.lua  自定义文件类型检测
-- 作用：将 .cu / .cuh 扩展名映射为 cuda 文件类型

vim.filetype.add({
  extension = {
    cu = "cuda",
    cuh = "cuda",
  },
})
