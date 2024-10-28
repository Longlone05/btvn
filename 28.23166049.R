#23166049 Đỗ Huỳnh Duy Long

library(ggplot2)

# Giả sử dữ liệu đã được đọc vào dataframe 'data'

# Khám phá dữ liệu
data <- mpg
ggplot(data, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = "loess")

# Tạo mô hình loess
model <- loess(hwy ~ displ, data = data)

# Dự đoán và đánh giá
predictions <- predict(model, newdata = data)
data$predicted_hwy <- predictions

# Tính R-squared
summary(model)$r.squared

# Vẽ đồ thị so sánh
ggplot(data, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_line(aes(y = predicted_hwy), color = "blue")