library(readr)

# 设置数据目录
data_dir <- './data/assignment_idaccuracy/Aminer/'

# 获取目录下所有文件的完整路径
file_paths <- list.files(data_dir, full.names = TRUE)  # 假设文件是 CSV 格式

# 初始化一个空的 data.frame 用于后续数据合并
combined_data <- data.frame()

# 遍历每个文件并读取
for (data_path in file_paths) {
  # 读取文件
  data <- read_csv(data_path)
  
  # 检查并提取需要的列
  if(all(c("doi", "标题", "期刊", "作者") %in% names(data))) {
    data_subset <- data[, c("doi", "标题", "期刊", "作者")]
    combined_data <- rbind(combined_data, data_subset)
  }
}

# 输出合并后的数据框
print(combined_data)

  

