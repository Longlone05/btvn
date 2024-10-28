#23166049 Đỗ Huỳnh Duy Long




#Biểu đồ so sánh sự ảnh hưởng cảu Vitamin C đến sự phát triển răng của lợn Guiea

library(ggplot2)
library(dplyr)

#Dữ liệu sự phát triển có sẵn trong R
ToothGrowth %>%
  ggplot(mapping = aes(x = factor(dose), y = len)) +#khởi tạo biểu đồ 
  geom_boxplot(color = "black", fill = "white") + # tạo biểu đồ hộp với viền đen nền trắng
  
  
  #Tính toán trung bình 
  stat_summary(fun = mean, geom = "point", shape = 18, size = 5, color = "blue") +
  #Tách 2 biểu đồ thành 2 bảng để so sánh
  facet_grid(~ supp, scales = "free") + 
  labs(x = "DOSE", y = "Len") +
  #chia các điểm cụ thể trên trục y
  scale_y_continuous(breaks = seq(5, 35, by = 5)) +
  theme_minimal() +
  theme(
    panel.spacing = unit(0.5, "lines"), # khoảng cách giữa 2 bảng
    panel.border = element_rect(color = "black", fill = NA, size = 1), #Thêm viền quanh bảng phụ
    strip.background = element_rect(color = "black", fill = NA) # Thêm viền nhãn OJ VC
  )

