library(readr)



# 设置数据目录
data_dir <- commandArgs(trailingOnly = TRUE)

# 获取目录下所有文件的完整路径
file_paths <- list.files(data_dir, full.names = TRUE)  # 假设文件是 CSV 格式

# 初始化一个空的 data.frame 用于后续数据合并
combined_data <- data.frame()


extract <- function(file_path){
  data <- read_csv(file_path)
  if(all(c("doi", "标题", "期刊", "作者") %in% names(data))) {
    return(data[, c("doi", "标题", "期刊", "作者")])
  }
  return(data.frame())
}

# 使用lapply
combined_data <- do.call(rbind, lapply(file_paths, extract))

print(combined_data)