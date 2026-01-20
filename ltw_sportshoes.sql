/*
 Navicat Premium Dump SQL

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : ltw_sportshoes

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 21/01/2026 01:02:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_entity_id` int UNSIGNED NULL DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `slogan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_link_position`(`link_url` ASC, `position` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'BlackFriday', 'https://cdn.shopify.com/s/files/1/0456/5070/6581/files/HP_BACKFRI_KV_DESK_VN.jpg?v=1763548181&width=1440', '/promotion/black-friday', 'PROMOTION', 1, 'product_slide_top', 1, 1, NULL, NULL, '');
INSERT INTO `banner` VALUES (2, 'Bộ sưu tập Mùa Hè', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888482/hero-banner_jhov6k.png', '/collection/summer-collection', 'COLLECTION', 2, 'menu_top', NULL, 1, NULL, NULL, 'Không chỉ là đôi giày, đó là phong cách khẳng định cá tính qua từng bước đi, chạm tới đỉnh cao của sự tự tin.');
INSERT INTO `banner` VALUES (3, 'Bộ sưu tập Nike', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888479/collection-2_kg2fwz.jpg', '/collection/nike-collection', 'COLLECTION', 1, 'menu_collection', 1, 1, NULL, NULL, 'Bộ sưu tập Nike');
INSERT INTO `banner` VALUES (4, 'Bộ sưu tập Puma', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888482/collection-puma_nm5wde.png', '/collection/puma-collection', 'COLLECTION', 4, 'menu_collection', 2, 1, NULL, NULL, NULL);
INSERT INTO `banner` VALUES (5, 'Bộ sưu tập Adidas', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888480/collection-3_thrnee.jpg', '/collection/adidas-collection', 'COLLECTION', 3, 'menu_collection', 3, 1, NULL, NULL, NULL);
INSERT INTO `banner` VALUES (6, 'Ưu đãi đặt biệt', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888482/special-banner_fgoitp.jpg', '/promotion/special-products', '', NULL, 'menu_special-product', NULL, 1, NULL, NULL, 'Giày Đẹp - Giá Hời');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `unique_brand_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (1, 'Nike', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768897349/nike-logo-black-clothes-design-icon-abstract-football-illustration-with-white-background-free-vector_eioefj.jpg', 1);
INSERT INTO `brand` VALUES (2, 'Adidas', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888421/adidas_logo_aoaqd3.png', 1);
INSERT INTO `brand` VALUES (3, 'Puma', 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888948/3c66d9fd0f29cdbca79c1d0b96c903ec_gyvjrx.jpg', 1);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ruleSet_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  UNIQUE INDEX `unique_collection_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `unique_collection_slug`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 'Nike', 'nike-collection', 'AUTO', 1);
INSERT INTO `collection` VALUES (2, 'Summer', 'summer-collection', 'MANUAL', 1);
INSERT INTO `collection` VALUES (3, 'Adidas', 'adidas-collection', 'AUTO', 1);
INSERT INTO `collection` VALUES (4, 'Puma', 'puma-collection', 'AUTO', 1);

-- ----------------------------
-- Table structure for collection_product
-- ----------------------------
DROP TABLE IF EXISTS `collection_product`;
CREATE TABLE `collection_product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `collection_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sort_order` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_collection_product`(`collection_id` ASC, `product_id` ASC) USING BTREE,
  UNIQUE INDEX `unique_collection_product`(`collection_id` ASC, `product_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `collection_product_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `collection_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_product
-- ----------------------------
INSERT INTO `collection_product` VALUES (1, 2, 1, 1);

-- ----------------------------
-- Table structure for collection_rule
-- ----------------------------
DROP TABLE IF EXISTS `collection_rule`;
CREATE TABLE `collection_rule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `collection_id` int UNSIGNED NOT NULL,
  `fieldName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_rule_definition`(`collection_id` ASC, `fieldName` ASC, `operator` ASC, `value` ASC) USING BTREE,
  CONSTRAINT `collection_rule_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_rule
-- ----------------------------
INSERT INTO `collection_rule` VALUES (1, 1, 'brand_id', '=', '1');
INSERT INTO `collection_rule` VALUES (0, 3, 'brand_id', '=', '2');
INSERT INTO `collection_rule` VALUES (3, 4, 'brand_id', '=', '3');

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hexcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `unique_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `hexcode`(`hexcode` ASC) USING BTREE,
  UNIQUE INDEX `unique_hexcode`(`hexcode` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES (1, 'Red', '#FF0000');
INSERT INTO `color` VALUES (2, 'Green', '#00FF00');
INSERT INTO `color` VALUES (3, 'Blue', '#0000FF');
INSERT INTO `color` VALUES (4, 'White', '#FFFFFF');
INSERT INTO `color` VALUES (5, 'Black', '#000000');
INSERT INTO `color` VALUES (6, 'Yellow', '#FFFF00');
INSERT INTO `color` VALUES (7, 'Purple', '#800080');
INSERT INTO `color` VALUES (8, 'Orange', '#FFA500');
INSERT INTO `color` VALUES (9, 'Brown', '#A52A2A');
INSERT INTO `color` VALUES (10, 'Pink', '#FFC0CB');
INSERT INTO `color` VALUES (11, 'Gray', '#808080');
INSERT INTO `color` VALUES (12, 'Nude', '#FFDBAC');

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `subscribed_at` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newsletter
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `color_id` int UNSIGNED NOT NULL,
  `size_id` int UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC, `product_id` ASC, `color_id` ASC, `size_id` ASC) USING BTREE,
  UNIQUE INDEX `unique_order_detail_variant`(`order_id` ASC, `product_id` ASC, `color_id` ASC, `size_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `color_id`(`color_id` ASC) USING BTREE,
  INDEX `size_id`(`size_id` ASC) USING BTREE,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_4` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `shipping_fee` decimal(10, 2) NULL DEFAULT NULL,
  `sub_total` decimal(10, 2) NULL DEFAULT NULL,
  `grand_total` decimal(10, 2) NULL DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `brand_id` int UNSIGNED NOT NULL,
  `added_at` datetime NULL DEFAULT current_timestamp(),
  `is_discontinue` tinyint(1) NULL DEFAULT 0,
  `is_available` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_product_name`(`name` ASC) USING BTREE,
  INDEX `brand_id`(`brand_id` ASC) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Air Jordan 1 Low', 'Huyền thoại vẫn sống mãi với Nike Air Force 1 \'07...\r\n\r\nChất liệu da thật và da tổng hợp bền bỉ, dễ dàng vệ sinh.\r\nBộ đệm Nike Air, ban đầu được thiết kế cho bóng rổ, mang lại sự êm ái lâu dài.\r\nCổ giày thấp có đệm mềm mại, tạo cảm giác thoải mái quanh mắt cá chân.', 2591000.00, 1, '2026-01-18 17:33:38', 0, 1);
INSERT INTO `product` VALUES (3, 'Air Jordan 1 Low SE', 'Luôn cảm thấy tươi mới trong từng bước đi. Mẫu Air Jordan 1 Low được làm mới với các lớp phủ bằng vải có thể xé rời ở phần thân trên và gót giày, để lộ lớp da bên dưới.', 3669000.00, 1, '2026-01-19 18:50:26', 0, 1);
INSERT INTO `product` VALUES (4, 'Air Jordan 1 LowS', 'Lấy cảm hứng từ phiên bản gốc ra mắt năm 1985, Air Jordan 1 LowS mang đến vẻ ngoài cổ điển, tinh tế, quen thuộc nhưng luôn tươi mới. Với thiết kế mang tính biểu tượng, hoàn hảo cho mọi trang phục, đôi giày này đảm bảo bạn luôn nổi bật.', 3239000.00, 1, '2026-01-20 19:26:16', 0, 1);
INSERT INTO `product` VALUES (5, 'Air Jordan White', 'Một diện mạo kinh điển trường tồn. Mẫu AJ1 này kết hợp thiết kế cổ điển của phiên bản gốc với chất liệu cao cấp, giúp bạn thoải mái suốt cả ngày. Các chi tiết óng ánh và logo Jumpman ba chiều làm nổi bật bất kỳ trang phục nào.', 2809000.00, 1, '2026-01-20 20:30:10', 0, 1);
INSERT INTO `product` VALUES (6, 'Air Jordan 1L', 'Dòng sản phẩm Method of Make mới nhất của chúng tôi lấy mẫu AJ1 quen thuộc và kết hợp nó với phong cách giày chạy bộ công nghệ cao. Chất liệu da kim loại sang trọng được kết hợp với các mảng vải thoáng khí tạo nên thiết kế nhiều lớp tinh tế. Logo Nike Swoosh nổi bật nằm ở phía trên cùng, hoàn thiện phong cách giày chạy bộ thập niên 2000.', 3959000.00, 1, '2026-01-20 20:36:58', 0, 1);
INSERT INTO `product` VALUES (7, 'Air Jordan 1 BE', 'Phiên bản đặc biệt AJ1 này tôn vinh món ăn cầm tay yêu thích của chúng ta: pizza! Chất liệu da mềm mại, bền chắc giúp đôi giày chịu được những giờ phút vui chơi với thiết kế táo bạo lấy cảm hứng từ một miếng pizza phủ đầy phô mai và nước sốt. Ai đang đói bụng nào?', 2247199.00, 1, '2026-01-20 20:52:49', 0, 1);
INSERT INTO `product` VALUES (8, 'Jordan 1 Low Alt', 'Bạn có năm giây rảnh không? Vậy thì bạn có đủ thời gian để giúp con bạn mang đôi giày Jordan này. Hệ thống khóa dán giúp dễ dàng mở giày và cố định vào chân bé. Và kiểu dáng thì 100% cổ điển của Jordan. Chúng sẽ luôn thời trang (như thể điều đó là không thể!) và bạn sẽ luôn ngầu. Cả hai cùng có lợi.', 1527000.00, 1, '2026-01-20 21:07:03', 0, 1);
INSERT INTO `product` VALUES (9, 'Jordan 1 Low Alt SE', 'Đôi giày Jordan phiên bản đặc biệt này thực sự nổi bật. Chất liệu da cao cấp và vải denim bền chắc kết hợp với điểm nhấn màu hồng và logo Swoosh đính sequin tạo nên phong cách vui tươi mà trẻ em có thể mang mỗi ngày. Phần dây buộc mở ra như một cuốn sách giúp trẻ dễ dàng và nhanh chóng mang giày.', 1431000.00, 1, '2026-01-20 21:10:28', 0, 1);
INSERT INTO `product` VALUES (10, 'Giày Jordan NU Retro 1 G', 'Là một sản phẩm kinh điển ngay lập tức trên sân golf, Jordan NU Retro 1 G kết hợp phong cách Jordan mang tính biểu tượng với công nghệ golf mới nhất của chúng tôi. Phần gót bằng cao su và tấm nhựa bền chắc ở mũi giày giúp bạn ổn định và có lớp đệm thoải mái. Bảy đinh tán có thể tháo rời tăng thêm độ bám, giúp bạn sẵn sàng cho những cú đánh nhanh và di chuyển dễ dàng trên sân.', 4409000.00, 1, '2026-01-20 21:14:35', 0, 1);
INSERT INTO `product` VALUES (11, 'Air Jordan 1 Brooklyn Low', 'Chất liệu da cao cấp kết hợp với đế dày chắc chắn giúp nâng tầm phong cách cá nhân của bạn. Các gai trên đế ngoài được thiết kế nổi bật và đệm khí Nike Air hỗ trợ từng bước chân. Và đừng quên ADN của AJ1: họa tiết hình kim cương trên gót giày hiển thị biểu tượng Jumpman, khẳng định di sản bóng rổ của bạn.', 4699000.00, 1, '2026-01-20 21:22:22', 0, 1);
INSERT INTO `product` VALUES (12, 'Nike Air Force 1 07 LV8', 'Thoải mái, bền bỉ và vượt thời gian—nó đứng đầu bảng xếp hạng vì một lý do. Phiên bản da lộn kết hợp các chi tiết kim loại với logo Swoosh xếp chồng lên nhau tạo nên phong cách phù hợp dù bạn đang ở trên sân hay đang di chuyển.', 2815000.00, 1, '2026-01-20 22:19:59', 0, 1);
INSERT INTO `product` VALUES (13, 'Nike Air Force 1 07 Mini Jewel', 'Thoải mái, bền bỉ và vượt thời gian—nó đứng đầu bảng xếp hạng vì một lý do. Mẫu AF-1 này kết hợp chất liệu da cao cấp với các chi tiết kim loại nhỏ tạo nên vẻ ngoài thanh lịch, cổ điển.', 2695199.00, 1, '2026-01-20 22:27:46', 0, 1);
INSERT INTO `product` VALUES (14, 'Nike Air Force 1 07', 'Vẻ rạng rỡ vẫn tiếp tục tỏa sáng với phiên bản bóng rổ nguyên bản. Kết hợp sự thoải mái trên sân bóng với phong cách ngoài sân, đôi giày này mang đến một diện mạo mới mẻ cho những gì bạn đã biết rõ nhất: thiết kế lấy cảm hứng từ thập niên 80, các chi tiết táo bạo và phong cách \"chỉ có lưới là đến đích\".', 3239000.00, 1, '2026-01-20 22:31:01', 0, 1);
INSERT INTO `product` VALUES (15, 'Nike Air Force 1 07 Premium', 'Thoải mái, bền bỉ và vượt thời gian – đó là lý do tại sao nó đứng đầu. Thiết kế cổ điển của thập niên 80 kết hợp với nét quyến rũ mới mẻ và các chi tiết táo bạo tạo nên phong cách phù hợp dù bạn đang ở trên sân thể thao hay đang di chuyển.', 3519000.00, 1, '2026-01-20 22:40:15', 0, 1);
INSERT INTO `product` VALUES (16, 'Nike Air Force 1 07 SE', 'Thoải mái, bền bỉ và vượt thời gian – đó là lý do tại sao nó đứng đầu. Thiết kế cổ điển của thập niên 80 kết hợp với chất liệu da mịn và logo Nike Swoosh có họa tiết tạo nên phong cách hoàn hảo cho mọi ngày.', 3239000.00, 1, '2026-01-20 22:46:13', 0, 1);
INSERT INTO `product` VALUES (17, 'Air Force 1 GORE-TEX Vibram', 'Giày AF-1 luôn là một đôi giày bền bỉ, nhưng chúng tôi đang nâng tầm nó lên một đẳng cấp mới. Phần thân giày hoàn toàn bằng da nằm trên lớp màng GORE-TEX chống thấm nước giúp bảo vệ bạn khỏi mưa, mưa đá và tuyết. Bên dưới đó là đế Vibram được thiết kế để giúp bạn vượt qua mọi bề mặt ẩm ướt, trơn trượt và lạnh giá. Mùa đông tuyệt vời nhất từ ​​trước đến nay?', 4999000.00, 1, '2026-01-20 22:50:07', 0, 1);
INSERT INTO `product` VALUES (18, 'Nike Air Force 1 07S', 'Hãy cùng chiêm ngưỡng đôi giày thể thao mà chúng tôi vô cùng yêu thích. Mẫu giày bóng rổ kinh điển này kết hợp chất liệu da cao cấp với sắc hồng tạo nên phong cách mà chúng ta không thể không yêu mến. Thêm vào đó, công nghệ đệm Nike Air mang lại sự thoải mái quen thuộc, giúp mỗi bước chân trở nên dễ chịu hơn.', 2929000.00, 1, '2026-01-20 23:00:29', 0, 1);
INSERT INTO `product` VALUES (19, 'Nike Force 1 Low EasyOn', 'Mẫu AF1 được thiết kế lại đặc biệt dành cho bàn chân của trẻ nhỏ trong phiên bản Force 1. Vẫn giữ nguyên phong cách và tinh thần bóng rổ của phiên bản cổ điển, nay được bổ sung tính năng EasyOn đột phá, giúp việc xỏ và tháo giày trở nên dễ dàng hơn bao giờ hết.\r\n', 2169000.00, 1, '2026-01-20 23:10:56', 0, 1);
INSERT INTO `product` VALUES (20, ' Nike Air Force 1', 'Tận hưởng sự thoải mái tối đa với giày Nike Air Force 1. Chất liệu da cổ điển và những chi tiết đã làm nên biểu tượng của đôi giày này chắc chắn sẽ giúp phong cách sneaker của bạn nổi bật trên đường phố.\r\n', 2419000.00, 1, '2026-01-20 23:15:48', 0, 1);
INSERT INTO `product` VALUES (21, 'Nike Air Force 1R', 'Bạn yêu thích nó quanh năm, nhưng phiên bản AF1 màu đỏ rực rỡ này thực sự khiến bạn mê mẩn. Phối màu cổ điển với tông đỏ nổi bật, đệm khí Air dưới đế và hình dáng không thể nhầm lẫn khiến AF1 trở thành một đôi giày thể thao kinh điển không bao giờ lỗi mốt.\r\n', 2679000.00, 1, '2026-01-20 23:22:42', 0, 1);
INSERT INTO `product` VALUES (22, 'Nike Metcon 10', 'Phát huy tối đa tiềm năng tập luyện đa năng của bạn với Metcon 10. Sản phẩm tối ưu hóa sự ổn định cho các bài tập nâng tạ nặng với tấm Hyperlift siêu bền và nâng cao khả năng vận động với lớp mút ReactX đàn hồi. Với khả năng hoàn trả năng lượng cao hơn và trọng lượng nhẹ hơn so với Metcon 9, nó giúp bạn chinh phục mọi động tác mà bài tập yêu cầu.\r\n', 4409000.00, 1, '2026-01-20 23:28:14', 0, 1);
INSERT INTO `product` VALUES (23, 'Nike Metcon 10 SE', 'Khai thác tối đa tiềm năng tập luyện đa năng của bạn với Metcon 10. Sản phẩm tối ưu hóa sự ổn định cho các bài tập nâng tạ nặng với tấm Hyperlift siêu bền và nâng cao khả năng vận động với lớp mút ReactX đàn hồi. Với khả năng hoàn trả năng lượng được cải thiện và trọng lượng nhẹ hơn so với phiên bản trước, Metcon 10 giúp bạn chinh phục mọi động tác mà bài tập yêu cầu.\r\n', 4409000.00, 1, '2026-01-20 23:37:18', 0, 1);
INSERT INTO `product` VALUES (24, 'Nike Metcon 10 AMP', 'Phát huy tối đa tiềm năng tập luyện đa năng của bạn với Metcon 10. Sản phẩm tối ưu hóa sự ổn định cho các bài tập nâng tạ nặng với tấm Hyperlift siêu bền và nâng cao khả năng vận động với lớp mút ReactX đàn hồi. Với khả năng hoàn trả năng lượng cao hơn và trọng lượng nhẹ hơn so với Metcon 9, nó giúp bạn chinh phục mọi động tác mà bài tập yêu cầu.\r\n', 3759000.00, 1, '2026-01-20 23:40:55', 0, 1);
INSERT INTO `product` VALUES (25, 'Nike Free Metcon 6', 'Từ những bài tập nâng tạ nặng đến những bài tập leo thang, từ những ngọn cỏ đến những nền tảng gồ ghề, từ sân cỏ nhân tạo đến đường chạy điền kinh, bài tập của bạn đều có mục đích nhất định, trọng tâm cụ thể. Giày Free Metcon 6 hỗ trợ mọi tiếng rên rỉ, tiếng gầm gừ và lời khẳng định \"Tôi làm được!\". Chúng tôi đã tăng thêm độ linh hoạt cho phần mũi giày của mẫu giày đa năng nhất và gia cố thêm phần gót bằng lớp mút dày hơn. Điều đó có nghĩa là bạn sẽ có nhiều tự do hơn cho các chuyển động năng động trong các bài tập plyometrics và cardio, cùng với nền tảng ổn định cần thiết cho việc nâng tạ.\r\n', 2815199.00, 1, '2026-01-20 23:45:02', 0, 1);
INSERT INTO `product` VALUES (26, 'Nike Free Metcon 6 SE', 'Giày Free Metcon 6 mở ra thế giới các bài tập luyện của bạn. Chúng tôi đã tăng thêm độ linh hoạt cho phần mũi giày của mẫu giày đa năng nhất và gia cố thêm phần gót bằng lớp mút dày hơn. Điều đó có nghĩa là bạn sẽ có nhiều tự do hơn cho các chuyển động năng động trong các bài tập plyometrics và cardio, cùng với sự ổn định cần thiết khi nâng tạ\r\n', 3063000.00, 1, '2026-01-20 23:55:53', 0, 1);
INSERT INTO `product` VALUES (27, 'Nike Free Metcon 6 AMP', 'Giày Free Metcon 6 mở ra thế giới những khả năng tập luyện mới cho bạn. Chúng tôi đã tăng thêm độ linh hoạt cho phần mũi giày của mẫu giày tập luyện đa năng nhất này và gia cố thêm phần gót bằng lớp mút dày hơn. Điều đó có nghĩa là bạn sẽ có nhiều tự do hơn cho các chuyển động năng động trong các bài tập plyometrics và cardio, cùng với sự ổn định cần thiết khi nâng tạ. Thiết kế họa tiết hoa lá sẽ làm cho buổi tập của bạn thêm phần sinh động khi bạn di chuyển nhẹ nhàng trong phòng.\r\n', 3063000.00, 1, '2026-01-20 23:58:27', 0, 1);
INSERT INTO `product` VALUES (28, 'Sabrina 3 \"Gamer\" EP', 'Để theo đuổi sự xuất sắc, Sabrina Ionescu cần một đôi giày có thể đáp ứng cả tinh thần làm việc và ý chí chiến thắng của cô. Và đó là lý do Sabrina 3 ra đời. Phần thân giày nhẹ và chắc chắn giúp cô được nâng đỡ nhờ hệ thống dây cáp, cho phép cô di chuyển, trượt và lùi bước một cách tự tin. Với đế ngoài bằng cao su siêu bền, phiên bản này mang lại độ bám tốt trên các sân ngoài trời.\r\n', 4109000.00, 1, '2026-01-21 00:01:59', 0, 1);
INSERT INTO `product` VALUES (29, 'Sabrina 3 EP', 'Để theo đuổi sự xuất sắc, Sabrina Ionescu cần một đôi giày có thể đáp ứng cả tinh thần làm việc và ý chí chiến thắng của cô. Và đó là lý do Sabrina 3 ra đời. Phần thân giày nhẹ và chắc chắn giúp cô được nâng đỡ nhờ hệ thống dây cáp, cho phép cô di chuyển, trượt và lùi bước một cách tự tin. Với đế ngoài bằng cao su siêu bền, phiên bản này mang lại độ bám tốt trên các sân ngoài trời.\r\n', 3829000.00, 1, '2026-01-21 00:05:35', 0, 1);
INSERT INTO `product` VALUES (30, 'Sabrina 3 Radiant EP', 'Sự theo đuổi sự xuất sắc của Sabrina Ionescu đòi hỏi một đôi giày có thể theo kịp cả tinh thần làm việc và ý chí chiến thắng của cô. Đó chính là Sabrina 3. Phần thân giày nhẹ và chắc chắn giúp cô được nâng đỡ bởi các dây cáp, cho phép cô di chuyển, trượt và lùi bước một cách tự tin. Thiết kế đặc biệt này tôn vinh sự thăng tiến vượt bậc của cô, lấy cảm hứng từ những bình minh ngoạn mục thường xuyên xuất hiện trên sân đấu của cô. Với đế ngoài bằng cao su siêu bền, phiên bản này mang lại độ bám tốt trên các sân ngoài trời.\r\n', 3829000.00, 1, '2026-01-21 00:18:50', 0, 1);
INSERT INTO `product` VALUES (31, 'Sabrina 3', 'Hành trình chinh phục đỉnh cao của Sabrina Ionescu đòi hỏi một đôi giày có thể theo kịp cường độ luyện tập của cô. Và đó chính là Sabrina 3. Phần thân giày nhẹ với các dây cáp giúp cô cảm thấy được nâng đỡ để di chuyển, trượt và lùi bước một cách tự tin, trong khi lớp đế giữa bằng xốp hai lớp mang lại sự thoải mái và ổn định tối ưu. Đánh bại đối thủ chưa bao giờ dễ dàng đến thế đối với đôi chân của bạn.\r\n\r\n\r\n', 2809000.00, 1, '2026-01-21 00:22:15', 0, 1);
INSERT INTO `product` VALUES (32, 'Nike Dunk Low Retro', 'Bạn luôn có thể tin tưởng vào một thiết kế kinh điển. Giày Dunk Low kết hợp phối màu đặc trưng với chất liệu cao cấp và lớp đệm êm ái mang đến sự thoải mái vượt trội kéo dài. Khả năng phối đồ là vô tận—bạn sẽ mang giày Dunk như thế nào?\r\n\r\n\r\n', 2343000.00, 1, '2026-01-21 00:26:02', 0, 1);
INSERT INTO `product` VALUES (33, 'Nike SB Dunk Low Pro', 'Biểu tượng bóng rổ thập niên 80 trở lại với những chi tiết kinh điển và phong cách bóng rổ hoài cổ. Mang phong cách cổ điển trở lại đường phố, cổ áo thấp có đệm giúp bạn thoải mái mang trận đấu đến bất cứ đâu.\r\n', 3239000.00, 1, '2026-01-21 00:28:53', 0, 1);
INSERT INTO `product` VALUES (34, 'Nike Dunk Low Retro SE', 'Biểu tượng bóng rổ thập niên 80 trở lại với những chi tiết kinh điển và phong cách bóng rổ hoài cổ. Mang phong cách cổ điển trở lại đường phố, cổ áo thấp có đệm giúp bạn thoải mái mang trận đấu đến bất cứ đâu.\r\n', 3519000.00, 1, '2026-01-21 00:35:40', 0, 1);
INSERT INTO `product` VALUES (35, 'Nike Dunk Low', 'Bạn luôn có thể tin tưởng vào một thiết kế kinh điển. Giày Dunk Low kết hợp kiểu phối màu đặc trưng với chất liệu cao cấp, có kết cấu và lớp đệm êm ái mang đến sự thoải mái vượt trội kéo dài. Khả năng phối đồ là vô tận—bạn sẽ mang giày Dunk như thế nào?\r\n', 3519000.00, 1, '2026-01-21 00:41:47', 0, 1);
INSERT INTO `product` VALUES (36, 'Nike Dunk Low Retro Limited', 'Bạn luôn có thể tin tưởng vào một thiết kế kinh điển. Giày Dunk Low kết hợp phối màu đặc trưng với chất liệu cao cấp và lớp đệm êm ái mang đến sự thoải mái vượt trội kéo dài. Khả năng phối đồ là vô tận—bạn sẽ mang giày Dunk như thế nào?\r\n', 3063000.00, 1, '2026-01-21 00:48:12', 0, 1);
INSERT INTO `product` VALUES (37, 'Nike Dunk Low Next Nature', 'Bạn luôn có thể tin tưởng vào một thiết kế kinh điển. Giày Dunk Low kết hợp kiểu phối màu đặc trưng với chất liệu cao cấp và lớp đệm êm ái mang đến sự thoải mái vượt trội kéo dài. Khả năng phối đồ là vô tận—bạn sẽ mang giày Dunk như thế nào?\r\n', 2343199.00, 1, '2026-01-21 00:53:31', 0, 1);

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `color_id` int UNSIGNED NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_product_color_sort`(`product_id` ASC, `color_id` ASC, `sort_order` ASC) USING BTREE,
  INDEX `color_id`(`color_id` ASC) USING BTREE,
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_img_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES (4, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888612/WMNS_AIR_JORDAN_1_LOW1_bhehuo.avif', 1, 1);
INSERT INTO `product_img` VALUES (5, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888613/WMNS_AIR_JORDAN_1_LOW2_ndr2l8.avif', 2, 1);
INSERT INTO `product_img` VALUES (6, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888615/WMNS_AIR_JORDAN_1_LOW3_xuaica.avif', 3, 1);
INSERT INTO `product_img` VALUES (7, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888617/WMNS_AIR_JORDAN_1_LOW4_z5g3bg.avif', 4, 1);
INSERT INTO `product_img` VALUES (8, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888618/WMNS_AIR_JORDAN_1_LOW5_ks0n8u.avif', 5, 1);
INSERT INTO `product_img` VALUES (10, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888740/WMNS_AIR_JORDAN_1_LOW1_fdzqjh.avif', 1, 1);
INSERT INTO `product_img` VALUES (11, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888743/WMNS_AIR_JORDAN_1_LOW2_ex3ht3.avif', 2, 1);
INSERT INTO `product_img` VALUES (12, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888745/WMNS_AIR_JORDAN_1_LOW3_tgy8pl.avif', 3, 1);
INSERT INTO `product_img` VALUES (13, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888746/WMNS_AIR_JORDAN_1_LOW4_p9fipn.avif', 4, 1);
INSERT INTO `product_img` VALUES (14, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888748/WMNS_AIR_JORDAN_1_LOW5_ddacyi.avif', 5, 1);
INSERT INTO `product_img` VALUES (16, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888631/WMNS_AIR_JORDAN_1_LOW1_e8m9av.avif', 1, 1);
INSERT INTO `product_img` VALUES (17, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888632/WMNS_AIR_JORDAN_1_LOW2_n065c3.avif', 2, 1);
INSERT INTO `product_img` VALUES (18, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888716/WMNS_AIR_JORDAN_1_LOW3_mfawh4.avif', 3, 1);
INSERT INTO `product_img` VALUES (19, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888718/WMNS_AIR_JORDAN_1_LOW4_hpgrfh.avif', 4, 1);
INSERT INTO `product_img` VALUES (20, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888721/WMNS_AIR_JORDAN_1_LOW5_b1u1g9.avif', 5, 1);
INSERT INTO `product_img` VALUES (21, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888794/AIR_JORDAN_1_LOW_SE1_hljzdv.avif', 1, 1);
INSERT INTO `product_img` VALUES (22, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888795/AIR_JORDAN_1_LOW_SE2_yv6dml.avif', 2, 1);
INSERT INTO `product_img` VALUES (23, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888797/AIR_JORDAN_1_LOW_SE3_gtgy1x.avif', 3, 1);
INSERT INTO `product_img` VALUES (24, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888799/AIR_JORDAN_1_LOW_SE4_q9tgjk.avif', 4, 1);
INSERT INTO `product_img` VALUES (25, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888802/AIR_JORDAN_1_LOW_SE5_ouw9wg.avif', 5, 1);
INSERT INTO `product_img` VALUES (71, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888620/WMNS_AIR_JORDAN_1_LOWM_omav9l.avif', 0, 1);
INSERT INTO `product_img` VALUES (72, 1, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888722/WMNS_AIR_JORDAN_1_LOWM_p2wfw4.avif', 0, 1);
INSERT INTO `product_img` VALUES (73, 1, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888750/WMNS_AIR_JORDAN_1_LOWM_mcelch.avif', 0, 1);
INSERT INTO `product_img` VALUES (74, 3, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888802/AIR_JORDAN_1_LOW_SEMain_jplbbr.avif', 0, 1);
INSERT INTO `product_img` VALUES (80, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911723/AIR_JORDAN_1_LOW_nocz0l.jpg', 0, 1);
INSERT INTO `product_img` VALUES (81, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911746/AIR_JORDAN_1_LOW_wbshsj.jpg', 1, 1);
INSERT INTO `product_img` VALUES (82, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911757/AIR_JORDAN_1_LOW_najtjz.jpg', 2, 1);
INSERT INTO `product_img` VALUES (83, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911775/AIR_JORDAN_1_LOW_lwokd0.jpg', 3, 1);
INSERT INTO `product_img` VALUES (84, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911784/AIR_JORDAN_1_LOW_c1ylco.jpg', 4, 1);
INSERT INTO `product_img` VALUES (85, 4, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911789/AIR_JORDAN_1_LOW_zbfl60.jpg', 5, 1);
INSERT INTO `product_img` VALUES (86, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912447/AIR_JORDAN_1_LOW_xhovfk.jpg', 0, 1);
INSERT INTO `product_img` VALUES (87, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912478/AIR_JORDAN_1_LOW_w435fn.jpg', 1, 1);
INSERT INTO `product_img` VALUES (88, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912488/AIR_JORDAN_1_LOW_kzozxk.jpg', 2, 1);
INSERT INTO `product_img` VALUES (89, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912502/AIR_JORDAN_1_LOW_rkonh7.jpg', 3, 1);
INSERT INTO `product_img` VALUES (90, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912495/AIR_JORDAN_1_LOW_cd9hk2.jpg', 4, 1);
INSERT INTO `product_img` VALUES (91, 4, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768912507/AIR_JORDAN_1_LOW_ikr3hu.jpg', 5, 1);
INSERT INTO `product_img` VALUES (93, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914866/AIR_JORDAN_1_LOW_ku2w7d.jpg', 0, 1);
INSERT INTO `product_img` VALUES (94, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914834/AIR_JORDAN_1_LOW_pxee19.jpg', 1, 1);
INSERT INTO `product_img` VALUES (95, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914845/AIR_JORDAN_1_LOW_ljimzy.jpg', 2, 1);
INSERT INTO `product_img` VALUES (96, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914858/AIR_JORDAN_1_LOW_aoyu9n.jpg', 3, 1);
INSERT INTO `product_img` VALUES (97, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914877/AIR_JORDAN_1_LOW_hzdcrx.jpg', 4, 1);
INSERT INTO `product_img` VALUES (98, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768914831/AIR_JORDAN_1_LOW_t0nusz.jpg', 5, 1);
INSERT INTO `product_img` VALUES (100, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915627/AIR_JORDAN_1_LOW_SE_28GS_29_nls7t9.jpg', 0, 1);
INSERT INTO `product_img` VALUES (101, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915640/AIR_JORDAN_1_LOW_SE_28GS_29_cd6dxr.jpg', 1, 1);
INSERT INTO `product_img` VALUES (102, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915646/AIR_JORDAN_1_LOW_SE_28GS_29_ywurp7.jpg', 2, 1);
INSERT INTO `product_img` VALUES (103, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915650/AIR_JORDAN_1_LOW_SE_28GS_29_h19ac4.jpg', 3, 1);
INSERT INTO `product_img` VALUES (104, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915633/AIR_JORDAN_1_LOW_SE_28GS_29_siredo.jpg', 4, 1);
INSERT INTO `product_img` VALUES (105, 5, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915656/AIR_JORDAN_1_LOW_SE_28GS_29_bbhcqz.jpg', 5, 1);
INSERT INTO `product_img` VALUES (106, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916086/WMNS_AIR_JORDAN_1_MM_LOW_V3_njsgj0.jpg', 0, 1);
INSERT INTO `product_img` VALUES (107, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916065/WMNS_AIR_JORDAN_1_MM_LOW_V3_ihlh2n.jpg', 1, 1);
INSERT INTO `product_img` VALUES (108, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916108/WMNS_AIR_JORDAN_1_MM_LOW_V3_doyhey.jpg', 2, 1);
INSERT INTO `product_img` VALUES (109, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916156/WMNS_AIR_JORDAN_1_MM_LOW_V3_xbfvjv.jpg', 3, 1);
INSERT INTO `product_img` VALUES (110, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916069/WMNS_AIR_JORDAN_1_MM_LOW_V3_ckxtg3.jpg', 4, 1);
INSERT INTO `product_img` VALUES (111, 6, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916149/WMNS_AIR_JORDAN_1_MM_LOW_V3_cwvukj.jpg', 5, 1);
INSERT INTO `product_img` VALUES (112, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916341/WMNS_AIR_JORDAN_1_MM_LOW_V3_z5kza4.jpg', 0, 1);
INSERT INTO `product_img` VALUES (113, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916321/WMNS_AIR_JORDAN_1_MM_LOW_V3_x4m1hi.jpg', 1, 1);
INSERT INTO `product_img` VALUES (114, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916333/WMNS_AIR_JORDAN_1_MM_LOW_V3_johqmb.jpg', 2, 1);
INSERT INTO `product_img` VALUES (115, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916336/WMNS_AIR_JORDAN_1_MM_LOW_V3_qt69nc.jpg', 3, 1);
INSERT INTO `product_img` VALUES (116, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916336/WMNS_AIR_JORDAN_1_MM_LOW_V3_qt69nc.jpg', 4, 1);
INSERT INTO `product_img` VALUES (117, 6, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916345/WMNS_AIR_JORDAN_1_MM_LOW_V3_otiszt.jpg', 5, 1);
INSERT INTO `product_img` VALUES (119, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917019/AIR_JORDAN_1_LOW_SE_28GS_29_rxc57q.jpg', 0, 1);
INSERT INTO `product_img` VALUES (120, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916996/AIR_JORDAN_1_LOW_SE_28GS_29_rvklf3.jpg', 1, 1);
INSERT INTO `product_img` VALUES (121, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917055/AIR_JORDAN_1_LOW_SE_28GS_29_vfdpsm.jpg', 2, 1);
INSERT INTO `product_img` VALUES (122, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917008/AIR_JORDAN_1_LOW_SE_28GS_29_k8c2kw.jpg', 3, 1);
INSERT INTO `product_img` VALUES (123, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917004/AIR_JORDAN_1_LOW_SE_28GS_29_pka4as.jpg', 4, 1);
INSERT INTO `product_img` VALUES (124, 7, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917029/AIR_JORDAN_1_LOW_SE_28GS_29_lhwvu0.jpg', 5, 1);
INSERT INTO `product_img` VALUES (125, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917877/JORDAN_1_LOW_ALT_SS_28PS_29_ummsyt.jpg', 0, 1);
INSERT INTO `product_img` VALUES (126, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917221/JORDAN_1_LOW_ALT_SS_28PS_29_axnx8w.jpg', 1, 1);
INSERT INTO `product_img` VALUES (127, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917234/JORDAN_1_LOW_ALT_SS_28PS_29_f8y5e6.jpg', 2, 1);
INSERT INTO `product_img` VALUES (128, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917239/JORDAN_1_LOW_ALT_SS_28PS_29_br4yko.jpg', 3, 1);
INSERT INTO `product_img` VALUES (129, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917229/JORDAN_1_LOW_ALT_SS_28PS_29_e1jocm.jpg', 4, 1);
INSERT INTO `product_img` VALUES (130, 8, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917884/JORDAN_1_LOW_ALT_SS_28PS_29_jnrs0c.jpg', 5, 1);
INSERT INTO `product_img` VALUES (131, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918102/JORDAN_1_LOW_ALT_SE_28PS_29_osydl4.jpg', 0, 1);
INSERT INTO `product_img` VALUES (132, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918084/JORDAN_1_LOW_ALT_SE_28PS_29_xebcx9.jpg', 1, 1);
INSERT INTO `product_img` VALUES (133, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918094/JORDAN_1_LOW_ALT_SE_28PS_29_a4mznb.jpg', 2, 1);
INSERT INTO `product_img` VALUES (134, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918097/JORDAN_1_LOW_ALT_SE_28PS_29_xjdn3o.jpg', 3, 1);
INSERT INTO `product_img` VALUES (135, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918093/JORDAN_1_LOW_ALT_SE_28PS_29_d56h56.jpg', 4, 1);
INSERT INTO `product_img` VALUES (136, 9, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918106/JORDAN_1_LOW_ALT_SE_28PS_29_o98lar.jpg', 5, 1);
INSERT INTO `product_img` VALUES (137, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918333/JORDAN_NU_RETRO_1_G_bzziks.jpg', 0, 1);
INSERT INTO `product_img` VALUES (138, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918317/JORDAN_NU_RETRO_1_G_o0dog3.jpg', 1, 1);
INSERT INTO `product_img` VALUES (139, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918324/JORDAN_NU_RETRO_1_G_rxlci3.jpg', 2, 1);
INSERT INTO `product_img` VALUES (140, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918328/JORDAN_NU_RETRO_1_G_reyo6u.jpg', 3, 1);
INSERT INTO `product_img` VALUES (141, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918320/JORDAN_NU_RETRO_1_G_igyh2a.jpg', 4, 1);
INSERT INTO `product_img` VALUES (142, 10, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918338/JORDAN_NU_RETRO_1_G_tczxcm.jpg', 5, 1);
INSERT INTO `product_img` VALUES (143, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918542/JORDAN_NU_RETRO_1_G_kjif0s.jpg', 0, 1);
INSERT INTO `product_img` VALUES (144, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918508/JORDAN_NU_RETRO_1_G_hq3gmr.jpg', 1, 1);
INSERT INTO `product_img` VALUES (145, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918520/JORDAN_NU_RETRO_1_G_zi8hrs.jpg', 2, 1);
INSERT INTO `product_img` VALUES (146, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918526/JORDAN_NU_RETRO_1_G_bxpedq.jpg', 3, 1);
INSERT INTO `product_img` VALUES (147, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918514/JORDAN_NU_RETRO_1_G_fc6i8g.jpg', 4, 1);
INSERT INTO `product_img` VALUES (148, 10, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918538/JORDAN_NU_RETRO_1_G_txtori.jpg', 5, 1);
INSERT INTO `product_img` VALUES (150, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918818/W_AIR_JORDAN_1_BROOKLYN_LOW_evyq3z.jpg', 0, 1);
INSERT INTO `product_img` VALUES (151, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918800/W_AIR_JORDAN_1_BROOKLYN_LOW_vjmnhm.jpg', 1, 1);
INSERT INTO `product_img` VALUES (152, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918808/W_AIR_JORDAN_1_BROOKLYN_LOW_r5xea2.jpg', 2, 1);
INSERT INTO `product_img` VALUES (153, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918812/W_AIR_JORDAN_1_BROOKLYN_LOW_detwrn.jpg', 3, 1);
INSERT INTO `product_img` VALUES (154, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918805/W_AIR_JORDAN_1_BROOKLYN_LOW_a1obav.jpg', 4, 1);
INSERT INTO `product_img` VALUES (155, 11, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918821/W_AIR_JORDAN_1_BROOKLYN_LOW_uerwzh.jpg', 5, 1);
INSERT INTO `product_img` VALUES (156, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768919005/W_AIR_JORDAN_1_BROOKLYN_LOW_elujro.jpg', 0, 1);
INSERT INTO `product_img` VALUES (157, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918969/W_AIR_JORDAN_1_BROOKLYN_LOW_loq2bq.jpg ', 1, 1);
INSERT INTO `product_img` VALUES (158, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918991/W_AIR_JORDAN_1_BROOKLYN_LOW_tpkzst.jpg', 2, 1);
INSERT INTO `product_img` VALUES (159, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918995/W_AIR_JORDAN_1_BROOKLYN_LOW_jlxsz9.jpg', 3, 1);
INSERT INTO `product_img` VALUES (160, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918973/W_AIR_JORDAN_1_BROOKLYN_LOW_meghtl.jpg', 4, 1);
INSERT INTO `product_img` VALUES (161, 11, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768919010/W_AIR_JORDAN_1_BROOKLYN_LOW_axfp2n.jpg', 5, 1);
INSERT INTO `product_img` VALUES (163, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922306/AIR_FORCE_1_2707_LV8_kpqifc.jpg', 0, 1);
INSERT INTO `product_img` VALUES (164, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922273/AIR_FORCE_1_2707_LV8_cfai22.jpg', 1, 1);
INSERT INTO `product_img` VALUES (165, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922286/AIR_FORCE_1_2707_LV8_m3huxn.jpg', 2, 1);
INSERT INTO `product_img` VALUES (166, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922291/AIR_FORCE_1_2707_LV8_pzdikt.jpg', 3, 1);
INSERT INTO `product_img` VALUES (167, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922278/AIR_FORCE_1_2707_LV8_ejwenw.jpg', 4, 1);
INSERT INTO `product_img` VALUES (168, 12, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922310/AIR_FORCE_1_2707_LV8_faaie5.jpg', 5, 1);
INSERT INTO `product_img` VALUES (169, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922438/AIR_FORCE_1_2707_LV8_ay3hdw.jpg', 0, 1);
INSERT INTO `product_img` VALUES (170, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922420/AIR_FORCE_1_2707_LV8_jhlzjj.jpg ', 1, 1);
INSERT INTO `product_img` VALUES (171, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922430/AIR_FORCE_1_2707_LV8_hvsoxu.jpg', 2, 1);
INSERT INTO `product_img` VALUES (172, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922435/AIR_FORCE_1_2707_LV8_aiv3xq.jpg', 3, 1);
INSERT INTO `product_img` VALUES (173, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922428/AIR_FORCE_1_2707_LV8_pf2a1q.jpg', 4, 1);
INSERT INTO `product_img` VALUES (174, 12, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922441/AIR_FORCE_1_2707_LV8_xjarsq.jpg', 5, 1);
INSERT INTO `product_img` VALUES (176, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922831/W_AIR_FORCE_1_2707_MINI_JEWEL_m1maht.jpg', 0, 1);
INSERT INTO `product_img` VALUES (177, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922697/W_AIR_FORCE_1_2707_MINI_JEWEL_ggyofl.jpg', 1, 1);
INSERT INTO `product_img` VALUES (178, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922706/W_AIR_FORCE_1_2707_MINI_JEWEL_cso3qb.jpg', 2, 1);
INSERT INTO `product_img` VALUES (179, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922823/W_AIR_FORCE_1_2707_MINI_JEWEL_cn3yoo.jpg', 3, 1);
INSERT INTO `product_img` VALUES (180, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922701/W_AIR_FORCE_1_2707_MINI_JEWEL_fnlpt3.jpg', 4, 1);
INSERT INTO `product_img` VALUES (181, 13, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922844/W_AIR_FORCE_1_2707_MINI_JEWEL_mkou30.jpg', 5, 1);
INSERT INTO `product_img` VALUES (182, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922954/AIR_FORCE_1_2707_ac8kbp.jpg', 0, 1);
INSERT INTO `product_img` VALUES (183, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922926/AIR_FORCE_1_2707_bgpg6c.jpg', 1, 1);
INSERT INTO `product_img` VALUES (184, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922938/AIR_FORCE_1_2707_flnvtd.jpg', 2, 1);
INSERT INTO `product_img` VALUES (185, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922944/AIR_FORCE_1_2707_tgbwfd.jpg', 3, 1);
INSERT INTO `product_img` VALUES (186, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922933/AIR_FORCE_1_2707_eiwwwh.jpg', 4, 1);
INSERT INTO `product_img` VALUES (187, 14, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922972/AIR_FORCE_1_2707_npoboy.jpg', 5, 1);
INSERT INTO `product_img` VALUES (188, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923176/AIR_FORCE_1_2707_t0usjb.jpg', 0, 1);
INSERT INTO `product_img` VALUES (189, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923153/AIR_FORCE_1_2707_hn0zvu.jpg ', 1, 1);
INSERT INTO `product_img` VALUES (190, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923136/AIR_FORCE_1_2707_o2vcwn.jpg', 2, 1);
INSERT INTO `product_img` VALUES (191, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923197/AIR_FORCE_1_2707_aaaugg.jpg', 3, 1);
INSERT INTO `product_img` VALUES (192, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923142/AIR_FORCE_1_2707_dmypji.jpg', 4, 1);
INSERT INTO `product_img` VALUES (193, 14, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923184/AIR_FORCE_1_2707_iekvv1.jpg', 5, 1);
INSERT INTO `product_img` VALUES (196, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923502/W_AIR_FORCE_1_2707_PRM_egauiy.jpg', 0, 1);
INSERT INTO `product_img` VALUES (197, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923412/W_AIR_FORCE_1_2707_PRM_gbmvbu.jpg', 1, 1);
INSERT INTO `product_img` VALUES (198, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923480/W_AIR_FORCE_1_2707_PRM_r0fsbk.jpg', 2, 1);
INSERT INTO `product_img` VALUES (199, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923488/W_AIR_FORCE_1_2707_PRM_rsjp8p.jpg', 3, 1);
INSERT INTO `product_img` VALUES (200, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923471/W_AIR_FORCE_1_2707_PRM_nziqpp.jpg', 4, 1);
INSERT INTO `product_img` VALUES (201, 15, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923507/W_AIR_FORCE_1_2707_PRM_sbpjwl.jpg', 5, 1);
INSERT INTO `product_img` VALUES (202, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923716/W_AIR_FORCE_1_2707_PRM_gmo5nx.jpg', 0, 1);
INSERT INTO `product_img` VALUES (203, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923674/W_AIR_FORCE_1_2707_PRM_wqoipo.jpg ', 1, 1);
INSERT INTO `product_img` VALUES (204, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923690/W_AIR_FORCE_1_2707_PRM_pjyfc2.jpg', 2, 1);
INSERT INTO `product_img` VALUES (205, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923703/W_AIR_FORCE_1_2707_PRM_uvraze.jpg', 3, 1);
INSERT INTO `product_img` VALUES (206, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923681/W_AIR_FORCE_1_2707_PRM_yng6u6.jpg', 4, 1);
INSERT INTO `product_img` VALUES (207, 15, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923724/W_AIR_FORCE_1_2707_PRM_kk5tcb.jpg', 5, 1);
INSERT INTO `product_img` VALUES (209, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923864/W_AIR_FORCE_1_2707_SE_zpqspk.jpg', 0, 1);
INSERT INTO `product_img` VALUES (210, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923835/W_AIR_FORCE_1_2707_SE_xdf0ye.jpg', 1, 1);
INSERT INTO `product_img` VALUES (211, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923846/W_AIR_FORCE_1_2707_SE_qihjef.jpg', 2, 1);
INSERT INTO `product_img` VALUES (212, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923853/W_AIR_FORCE_1_2707_SE_wiscv4.jpg', 3, 1);
INSERT INTO `product_img` VALUES (213, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923839/W_AIR_FORCE_1_2707_SE_zcify0.jpg', 4, 1);
INSERT INTO `product_img` VALUES (214, 16, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923879/W_AIR_FORCE_1_2707_SE_jc0qau.jpg', 5, 1);
INSERT INTO `product_img` VALUES (215, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924054/AIR_FORCE_1_GTX_VIBRAM_fnq6cp.jpg', 0, 1);
INSERT INTO `product_img` VALUES (216, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924027/AIR_FORCE_1_GTX_VIBRAM_q5tnnu.jpg', 1, 1);
INSERT INTO `product_img` VALUES (217, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924036/AIR_FORCE_1_GTX_VIBRAM_f14l4a.jpg', 2, 1);
INSERT INTO `product_img` VALUES (218, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924047/AIR_FORCE_1_GTX_VIBRAM_vo7yxt.jpg', 3, 1);
INSERT INTO `product_img` VALUES (219, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924031/AIR_FORCE_1_GTX_VIBRAM_dw8kpo.jpg', 4, 1);
INSERT INTO `product_img` VALUES (220, 17, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924183/AIR_FORCE_1_GTX_VIBRAM_a1aq4l.jpg', 5, 1);
INSERT INTO `product_img` VALUES (221, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924319/AIR_FORCE_1_2707_yhelx8.jpg', 0, 1);
INSERT INTO `product_img` VALUES (222, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924310/AIR_FORCE_1_2707_myfcwm.jpg', 1, 1);
INSERT INTO `product_img` VALUES (223, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924310/AIR_FORCE_1_2707_myfcwm.jpg', 2, 1);
INSERT INTO `product_img` VALUES (224, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924337/AIR_FORCE_1_2707_hmi9mm.jpg', 3, 1);
INSERT INTO `product_img` VALUES (225, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924348/AIR_FORCE_1_2707_bnmtdu.jpg', 4, 1);
INSERT INTO `product_img` VALUES (226, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924332/AIR_FORCE_1_2707_uubtrc.jpg', 5, 1);
INSERT INTO `product_img` VALUES (227, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925312/FORCE_1_LOW_EASYON_28PS_29_svastj.jpg', 0, 1);
INSERT INTO `product_img` VALUES (228, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925276/FORCE_1_LOW_EASYON_28PS_29_i39pfn.jpg', 1, 1);
INSERT INTO `product_img` VALUES (229, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925289/FORCE_1_LOW_EASYON_28PS_29_fauwuy.jpg', 2, 1);
INSERT INTO `product_img` VALUES (230, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925297/FORCE_1_LOW_EASYON_28PS_29_aacu34.jpg', 3, 1);
INSERT INTO `product_img` VALUES (231, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925282/FORCE_1_LOW_EASYON_28PS_29_pbpo0z.png', 4, 1);
INSERT INTO `product_img` VALUES (232, 19, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925340/FORCE_1_LOW_EASYON_28PS_29_nzyc6t.jpg', 5, 1);
INSERT INTO `product_img` VALUES (233, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925624/AIR_FORCE_1_28GS_29_avnkzx.jpg', 0, 1);
INSERT INTO `product_img` VALUES (234, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925591/AIR_FORCE_1_28GS_29_pfmhwt.jpg', 1, 1);
INSERT INTO `product_img` VALUES (235, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925611/AIR_FORCE_1_28GS_29_gflgal.jpg', 2, 1);
INSERT INTO `product_img` VALUES (236, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925621/AIR_FORCE_1_28GS_29_ravx3i.jpg', 3, 1);
INSERT INTO `product_img` VALUES (237, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925566/AIR_FORCE_1_28GS_29_uz4h1o.jpg', 4, 1);
INSERT INTO `product_img` VALUES (238, 20, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925655/AIR_FORCE_1_28GS_29_hty40x.jpg', 5, 1);
INSERT INTO `product_img` VALUES (239, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925837/AIR_FORCE_1_28GS_29_kjtwlp.jpg', 0, 1);
INSERT INTO `product_img` VALUES (240, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925806/AIR_FORCE_1_28GS_29_si5krb.jpg', 1, 1);
INSERT INTO `product_img` VALUES (241, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925821/AIR_FORCE_1_28GS_29_js6qsl.jpg', 2, 1);
INSERT INTO `product_img` VALUES (242, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925826/AIR_FORCE_1_28GS_29_jchgiu.jpg', 3, 1);
INSERT INTO `product_img` VALUES (243, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925811/AIR_FORCE_1_28GS_29_fe4ob1.jpg', 4, 1);
INSERT INTO `product_img` VALUES (244, 20, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925855/AIR_FORCE_1_28GS_29_nagoxx.jpg', 5, 1);
INSERT INTO `product_img` VALUES (246, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926111/AIR_FORCE_1_V_28GS_29_cpzje3.jpg', 0, 1);
INSERT INTO `product_img` VALUES (247, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925980/AIR_FORCE_1_V_28GS_29_qsvwuk.jpg', 1, 1);
INSERT INTO `product_img` VALUES (248, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926075/AIR_FORCE_1_V_28GS_29_yi1drk.jpg', 2, 1);
INSERT INTO `product_img` VALUES (249, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926075/AIR_FORCE_1_V_28GS_29_yi1drk.jpg', 3, 1);
INSERT INTO `product_img` VALUES (250, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925987/AIR_FORCE_1_V_28GS_29_f2bvyc.jpg', 4, 1);
INSERT INTO `product_img` VALUES (251, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926081/AIR_FORCE_1_V_28GS_29_l2xtyj.jpg', 5, 1);
INSERT INTO `product_img` VALUES (252, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926345/M_NIKE_METCON_10_uleukn.jpg', 0, 1);
INSERT INTO `product_img` VALUES (253, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926312/M_NIKE_METCON_10_r1oca9.jpg', 1, 1);
INSERT INTO `product_img` VALUES (254, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926328/M_NIKE_METCON_10_gypnrs.jpg', 2, 1);
INSERT INTO `product_img` VALUES (255, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926340/M_NIKE_METCON_10_darxgp.jpg', 3, 1);
INSERT INTO `product_img` VALUES (256, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926319/M_NIKE_METCON_10_nvxjkm.jpg', 4, 1);
INSERT INTO `product_img` VALUES (257, 22, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926359/M_NIKE_METCON_10_tgjbgl.jpg', 5, 1);
INSERT INTO `product_img` VALUES (258, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926567/M_NIKE_METCON_10_jdlthx.jpg', 0, 1);
INSERT INTO `product_img` VALUES (259, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926537/M_NIKE_METCON_10_pzl4kx.jpg', 1, 1);
INSERT INTO `product_img` VALUES (260, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926549/M_NIKE_METCON_10_hfpwmq.jpg', 2, 1);
INSERT INTO `product_img` VALUES (261, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926555/M_NIKE_METCON_10_qykfyc.jpg', 3, 1);
INSERT INTO `product_img` VALUES (262, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926542/M_NIKE_METCON_10_ddpktd.jpg', 4, 1);
INSERT INTO `product_img` VALUES (263, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926595/M_NIKE_METCON_10_zhyeda.jpg', 5, 1);
INSERT INTO `product_img` VALUES (265, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926743/M_NIKE_METCON_10_icbkwt.jpg', 0, 1);
INSERT INTO `product_img` VALUES (266, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926683/M_NIKE_METCON_10_mipuim.jpg', 1, 1);
INSERT INTO `product_img` VALUES (267, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926701/M_NIKE_METCON_10_dmyj0g.jpg', 2, 1);
INSERT INTO `product_img` VALUES (268, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926711/M_NIKE_METCON_10_vxamli.jpg', 3, 1);
INSERT INTO `product_img` VALUES (269, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926689/M_NIKE_METCON_10_eiug2q.jpg', 4, 1);
INSERT INTO `product_img` VALUES (270, 22, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926786/M_NIKE_METCON_10_txqju1.jpg', 5, 1);
INSERT INTO `product_img` VALUES (272, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927010/W_NIKE_METCON_10_SE_waj3ub.jpg', 0, 1);
INSERT INTO `product_img` VALUES (273, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926889/W_NIKE_METCON_10_SE_mpda6c.jpg', 1, 1);
INSERT INTO `product_img` VALUES (274, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926964/W_NIKE_METCON_10_SE_yhdbpo.jpg', 2, 1);
INSERT INTO `product_img` VALUES (275, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926978/W_NIKE_METCON_10_SE_iowt7z.jpg', 3, 1);
INSERT INTO `product_img` VALUES (276, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926910/W_NIKE_METCON_10_SE_ubklg5.jpg', 4, 1);
INSERT INTO `product_img` VALUES (277, 23, 12, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927023/W_NIKE_METCON_10_SE_etvrmn.jpg', 5, 1);
INSERT INTO `product_img` VALUES (278, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927173/W_NIKE_METCON_10_AMP_rum0x9.jpg', 0, 1);
INSERT INTO `product_img` VALUES (279, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927134/W_NIKE_METCON_10_AMP_jcya4l.jpg', 1, 1);
INSERT INTO `product_img` VALUES (280, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927152/W_NIKE_METCON_10_AMP_uorldv.jpg', 2, 1);
INSERT INTO `product_img` VALUES (281, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927230/W_NIKE_METCON_10_AMP_ddh5np.jpg', 3, 1);
INSERT INTO `product_img` VALUES (282, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927141/W_NIKE_METCON_10_AMP_bygwqr.jpg', 4, 1);
INSERT INTO `product_img` VALUES (283, 24, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927187/W_NIKE_METCON_10_AMP_uyvx6n.jpg', 5, 1);
INSERT INTO `product_img` VALUES (284, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927461/NIKE_FREE_METCON_6_us1lxd.jpg', 0, 1);
INSERT INTO `product_img` VALUES (285, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927388/NIKE_FREE_METCON_6_yipn75.jpg', 1, 1);
INSERT INTO `product_img` VALUES (286, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927414/NIKE_FREE_METCON_6_htbwhf.jpg', 2, 1);
INSERT INTO `product_img` VALUES (287, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927421/NIKE_FREE_METCON_6_unn6n6.jpg', 3, 1);
INSERT INTO `product_img` VALUES (288, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927395/NIKE_FREE_METCON_6_mlbnib.jpg', 4, 1);
INSERT INTO `product_img` VALUES (289, 25, 8, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927438/NIKE_FREE_METCON_6_opoogq.jpg', 5, 1);
INSERT INTO `product_img` VALUES (290, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927604/NIKE_FREE_METCON_6_hkwmig.jpg', 0, 1);
INSERT INTO `product_img` VALUES (291, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927549/NIKE_FREE_METCON_6_zt7fwl.jpg', 1, 1);
INSERT INTO `product_img` VALUES (292, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927575/NIKE_FREE_METCON_6_bsfpa7.jpg', 2, 1);
INSERT INTO `product_img` VALUES (293, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927591/NIKE_FREE_METCON_6_lnkw8j.jpg', 3, 1);
INSERT INTO `product_img` VALUES (294, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927556/NIKE_FREE_METCON_6_lxoroo.jpg', 4, 1);
INSERT INTO `product_img` VALUES (295, 25, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927620/NIKE_FREE_METCON_6_qylwtg.jpg', 5, 1);
INSERT INTO `product_img` VALUES (297, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927719/NIKE_FREE_METCON_6_lqqf2r.jpg', 0, 1);
INSERT INTO `product_img` VALUES (298, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927672/NIKE_FREE_METCON_6_yaqgay.jpg', 1, 1);
INSERT INTO `product_img` VALUES (299, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927768/NIKE_FREE_METCON_6_a8cv98.jpg', 2, 1);
INSERT INTO `product_img` VALUES (300, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927697/NIKE_FREE_METCON_6_mbvw2y.jpg', 3, 1);
INSERT INTO `product_img` VALUES (301, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927680/NIKE_FREE_METCON_6_qn2ggi.jpg', 4, 1);
INSERT INTO `product_img` VALUES (302, 25, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927734/NIKE_FREE_METCON_6_vlscvs.jpg', 5, 1);
INSERT INTO `product_img` VALUES (304, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928086/W_NIKE_FREE_METCON_6_SE_hnmwxa.jpg', 0, 1);
INSERT INTO `product_img` VALUES (305, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928038/W_NIKE_FREE_METCON_6_SE_yxr2uo.jpg', 1, 1);
INSERT INTO `product_img` VALUES (306, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928062/W_NIKE_FREE_METCON_6_SE_oa06xt.jpg', 2, 1);
INSERT INTO `product_img` VALUES (307, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928069/W_NIKE_FREE_METCON_6_SE_daeqoo.jpg', 3, 1);
INSERT INTO `product_img` VALUES (308, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928045/W_NIKE_FREE_METCON_6_SE_rumt19.jpg', 4, 1);
INSERT INTO `product_img` VALUES (309, 26, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928110/W_NIKE_FREE_METCON_6_SE_xslgom.jpg', 5, 1);
INSERT INTO `product_img` VALUES (310, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928261/W_NIKE_FREE_METCON_6_AMP_qsfw08.jpg', 0, 1);
INSERT INTO `product_img` VALUES (311, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928208/W_NIKE_FREE_METCON_6_AMP_a6gshq.jpg', 1, 1);
INSERT INTO `product_img` VALUES (312, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928227/W_NIKE_FREE_METCON_6_AMP_qtnp1f.jpg', 2, 1);
INSERT INTO `product_img` VALUES (313, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928248/W_NIKE_FREE_METCON_6_AMP_zkzs8x.jpg', 3, 1);
INSERT INTO `product_img` VALUES (314, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928215/W_NIKE_FREE_METCON_6_AMP_z92j72.jpg', 4, 1);
INSERT INTO `product_img` VALUES (315, 27, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928277/W_NIKE_FREE_METCON_6_AMP_d09lsq.jpg', 5, 1);
INSERT INTO `product_img` VALUES (316, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928490/SABRINA_3_GAMER_EP_jgvcvl.jpg', 0, 1);
INSERT INTO `product_img` VALUES (317, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928411/SABRINA_3_GAMER_EP_tcwvue.jpg', 1, 1);
INSERT INTO `product_img` VALUES (318, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928437/SABRINA_3_GAMER_EP_webqop.jpg', 2, 1);
INSERT INTO `product_img` VALUES (319, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928461/SABRINA_3_GAMER_EP_qtbdmp.jpg', 3, 1);
INSERT INTO `product_img` VALUES (320, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928421/SABRINA_3_GAMER_EP_euwh1s.jpg', 4, 1);
INSERT INTO `product_img` VALUES (321, 28, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928507/SABRINA_3_GAMER_EP_zvm6bg.jpg', 5, 1);
INSERT INTO `product_img` VALUES (322, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928691/SABRINA_3_EP_obvdco.jpg  ', 0, 1);
INSERT INTO `product_img` VALUES (323, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928618/SABRINA_3_EP_ipowcy.jpg', 1, 1);
INSERT INTO `product_img` VALUES (324, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928644/SABRINA_3_EP_btl6md.jpg', 2, 1);
INSERT INTO `product_img` VALUES (325, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928669/SABRINA_3_EP_oc1w7h.jpg', 3, 1);
INSERT INTO `product_img` VALUES (326, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928637/SABRINA_3_EP_dazvcq.jpg', 4, 1);
INSERT INTO `product_img` VALUES (327, 29, 10, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928716/SABRINA_3_EP_zchckj.jpg', 5, 1);
INSERT INTO `product_img` VALUES (328, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928856/SABRINA_3_EP_gbmxca.jpg', 0, 1);
INSERT INTO `product_img` VALUES (329, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928782/SABRINA_3_EP_n3sowp.jpg', 1, 1);
INSERT INTO `product_img` VALUES (330, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928835/SABRINA_3_EP_lgwqfy.jpg', 2, 1);
INSERT INTO `product_img` VALUES (331, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928851/SABRINA_3_EP_orzzdt.jpg', 3, 1);
INSERT INTO `product_img` VALUES (332, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928794/SABRINA_3_EP_x29mln.jpg', 4, 1);
INSERT INTO `product_img` VALUES (333, 29, 2, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928878/SABRINA_3_EP_m259wr.jpg', 5, 1);
INSERT INTO `product_img` VALUES (335, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928990/SABRINA_3_EP_nw7i2w.jpg', 0, 1);
INSERT INTO `product_img` VALUES (336, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928954/SABRINA_3_EP_yxduw8.jpg', 1, 1);
INSERT INTO `product_img` VALUES (337, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928971/SABRINA_3_EP_owbmve.jpg', 2, 1);
INSERT INTO `product_img` VALUES (338, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928980/SABRINA_3_EP_oaj71i.jpg', 3, 1);
INSERT INTO `product_img` VALUES (339, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928949/SABRINA_3_EP_knshpw.jpg', 4, 1);
INSERT INTO `product_img` VALUES (340, 29, 3, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928999/SABRINA_3_EP_w5ljx7.jpg', 5, 1);
INSERT INTO `product_img` VALUES (342, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929443/SABRINA_3_EP_debxjo.jpg', 0, 1);
INSERT INTO `product_img` VALUES (343, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929366/SABRINA_3_EP_ckpmsk.jpg', 1, 1);
INSERT INTO `product_img` VALUES (344, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929395/SABRINA_3_EP_ldq8sj.jpg', 2, 1);
INSERT INTO `product_img` VALUES (345, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929420/SABRINA_3_EP_wvzhme.jpg', 3, 1);
INSERT INTO `product_img` VALUES (346, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929377/SABRINA_3_EP_yoxrrl.jpg', 4, 1);
INSERT INTO `product_img` VALUES (347, 30, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929462/SABRINA_3_EP_ajeklo.jpg', 5, 1);
INSERT INTO `product_img` VALUES (348, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929692/SABRINA_3_KC_28GS_29_ll0byl.jpg', 0, 1);
INSERT INTO `product_img` VALUES (349, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929617/SABRINA_3_KC_28GS_29_ykjpf2.jpg', 1, 1);
INSERT INTO `product_img` VALUES (350, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929649/SABRINA_3_KC_28GS_29_dsnvbp.jpg', 2, 1);
INSERT INTO `product_img` VALUES (351, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929670/SABRINA_3_KC_28GS_29_np1lcb.jpg', 3, 1);
INSERT INTO `product_img` VALUES (352, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929626/SABRINA_3_KC_28GS_29_lw6xxw.jpg', 4, 1);
INSERT INTO `product_img` VALUES (353, 31, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929722/SABRINA_3_KC_28GS_29_iupsi3.jpg', 5, 1);
INSERT INTO `product_img` VALUES (354, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929928/NIKE_DUNK_LOW_RETRO_mtaj81.jpg', 0, 1);
INSERT INTO `product_img` VALUES (355, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929857/NIKE_DUNK_LOW_RETRO_s5qoky.jpg', 1, 1);
INSERT INTO `product_img` VALUES (356, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929889/NIKE_DUNK_LOW_RETRO_ukphux.jpg', 2, 1);
INSERT INTO `product_img` VALUES (357, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929915/NIKE_DUNK_LOW_RETRO_ncxoyd.jpg', 3, 1);
INSERT INTO `product_img` VALUES (358, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929868/NIKE_DUNK_LOW_RETRO_m7ob9u.jpg', 4, 1);
INSERT INTO `product_img` VALUES (359, 32, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929950/NIKE_DUNK_LOW_RETRO_zrraal.jpg', 5, 1);
INSERT INTO `product_img` VALUES (360, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930105/NIKE_SB_DUNK_LOW_PRO_u3eggd.jpg', 0, 1);
INSERT INTO `product_img` VALUES (361, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930015/NIKE_SB_DUNK_LOW_PRO_qm22qq.jpg', 1, 1);
INSERT INTO `product_img` VALUES (362, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930061/NIKE_SB_DUNK_LOW_PRO_hidyl0.jpg', 2, 1);
INSERT INTO `product_img` VALUES (363, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930088/NIKE_SB_DUNK_LOW_PRO_kiipcz.jpg', 3, 1);
INSERT INTO `product_img` VALUES (364, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930027/NIKE_SB_DUNK_LOW_PRO_hukoge.jpg', 4, 1);
INSERT INTO `product_img` VALUES (365, 33, 5, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930119/NIKE_SB_DUNK_LOW_PRO_hoazkr.jpg', 5, 1);
INSERT INTO `product_img` VALUES (366, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930269/NIKE_SB_DUNK_LOW_PRO_cyvahx.jpg', 0, 1);
INSERT INTO `product_img` VALUES (367, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930169/NIKE_SB_DUNK_LOW_PRO_zmspeb.jpg', 1, 1);
INSERT INTO `product_img` VALUES (368, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930228/NIKE_SB_DUNK_LOW_PRO_e0v6sq.jpg', 2, 1);
INSERT INTO `product_img` VALUES (369, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930258/NIKE_SB_DUNK_LOW_PRO_hlrwwd.jpg', 3, 1);
INSERT INTO `product_img` VALUES (370, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930178/NIKE_SB_DUNK_LOW_PRO_bgmfxi.jpg', 4, 1);
INSERT INTO `product_img` VALUES (371, 33, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930289/NIKE_SB_DUNK_LOW_PRO_f7mrjl.jpg', 5, 1);
INSERT INTO `product_img` VALUES (373, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930497/NIKE_DUNK_LOW_RETRO_SE_n9kxdd.jpg', 0, 1);
INSERT INTO `product_img` VALUES (374, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930416/NIKE_DUNK_LOW_RETRO_SE_zajie4.jpg', 1, 1);
INSERT INTO `product_img` VALUES (375, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930441/NIKE_DUNK_LOW_RETRO_SE_qkfqmq.jpg', 2, 1);
INSERT INTO `product_img` VALUES (376, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930488/NIKE_DUNK_LOW_RETRO_SE_ffzypk.jpg', 3, 1);
INSERT INTO `product_img` VALUES (377, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930428/NIKE_DUNK_LOW_RETRO_SE_gjyrwo.jpg', 4, 1);
INSERT INTO `product_img` VALUES (378, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930523/NIKE_DUNK_LOW_RETRO_SE_rtu8xl.jpg', 5, 1);
INSERT INTO `product_img` VALUES (379, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930666/NIKE_DUNK_LOW_RETRO_SE_usxs2h.jpg', 0, 1);
INSERT INTO `product_img` VALUES (380, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930580/NIKE_DUNK_LOW_RETRO_SE_a2nfvf.jpg', 1, 1);
INSERT INTO `product_img` VALUES (381, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930609/NIKE_DUNK_LOW_RETRO_SE_o59hyg.jpg', 2, 1);
INSERT INTO `product_img` VALUES (382, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930627/NIKE_DUNK_LOW_RETRO_SE_imytf2.jpg', 3, 1);
INSERT INTO `product_img` VALUES (383, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930592/NIKE_DUNK_LOW_RETRO_SE_szmnjf.jpg', 4, 1);
INSERT INTO `product_img` VALUES (384, 34, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930671/NIKE_DUNK_LOW_RETRO_SE_okuwnr.jpg', 5, 1);
INSERT INTO `product_img` VALUES (386, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930851/WMNS_NIKE_DUNK_LOW_zujali.jpg', 0, 1);
INSERT INTO `product_img` VALUES (387, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930786/WMNS_NIKE_DUNK_LOW_mfvvmu.jpg', 1, 1);
INSERT INTO `product_img` VALUES (388, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930811/WMNS_NIKE_DUNK_LOW_wukup6.jpg', 2, 1);
INSERT INTO `product_img` VALUES (389, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930827/WMNS_NIKE_DUNK_LOW_xzqlfx.jpg  ', 3, 1);
INSERT INTO `product_img` VALUES (390, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930795/WMNS_NIKE_DUNK_LOW_sdsfah.jpg', 4, 1);
INSERT INTO `product_img` VALUES (391, 35, 4, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930872/WMNS_NIKE_DUNK_LOW_zbaygf.jpg', 5, 1);
INSERT INTO `product_img` VALUES (392, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931021/WMNS_NIKE_DUNK_LOW_rygu15.jpg', 0, 1);
INSERT INTO `product_img` VALUES (393, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930962/WMNS_NIKE_DUNK_LOW_eclyyz.jpg', 1, 1);
INSERT INTO `product_img` VALUES (394, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930993/WMNS_NIKE_DUNK_LOW_tqcysx.jpg', 2, 1);
INSERT INTO `product_img` VALUES (395, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931007/WMNS_NIKE_DUNK_LOW_b5qp3r.jpg', 3, 1);
INSERT INTO `product_img` VALUES (396, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930978/WMNS_NIKE_DUNK_LOW_k0cwht.jpg', 4, 1);
INSERT INTO `product_img` VALUES (397, 35, 9, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931038/WMNS_NIKE_DUNK_LOW_jdozya.jpg', 5, 1);
INSERT INTO `product_img` VALUES (399, 36, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931264/NIKE_DUNK_LOW_RETRO_LTD_HWN_i4oy1b.jpg', 0, 1);
INSERT INTO `product_img` VALUES (400, 36, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931179/NIKE_DUNK_LOW_RETRO_LTD_HWN_nh4zds.jpg', 1, 1);
INSERT INTO `product_img` VALUES (401, 36, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931209/NIKE_DUNK_LOW_RETRO_LTD_HWN_j3bjxf.jpg', 2, 1);
INSERT INTO `product_img` VALUES (402, 36, 7, 'hhttps://res.cloudinary.com/dnmowplwi/image/upload/v1768931236/NIKE_DUNK_LOW_RETRO_LTD_HWN_hh3oxs.jpg', 3, 1);
INSERT INTO `product_img` VALUES (403, 36, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931189/NIKE_DUNK_LOW_RETRO_LTD_HWN_zlkz59.jpg', 4, 1);
INSERT INTO `product_img` VALUES (404, 36, 7, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931282/NIKE_DUNK_LOW_RETRO_LTD_HWN_mlsc7o.jpg', 5, 1);
INSERT INTO `product_img` VALUES (405, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931583/W_NIKE_DUNK_LOW_NEXT_NATURE_ikgf1c.jpg', 0, 1);
INSERT INTO `product_img` VALUES (406, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931454/W_NIKE_DUNK_LOW_NEXT_NATURE_iahnai.jpg', 1, 1);
INSERT INTO `product_img` VALUES (407, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931492/W_NIKE_DUNK_LOW_NEXT_NATURE_yxm5v7.jpg', 2, 1);
INSERT INTO `product_img` VALUES (408, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931557/W_NIKE_DUNK_LOW_NEXT_NATURE_zd7wah.jpg', 3, 1);
INSERT INTO `product_img` VALUES (409, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931529/W_NIKE_DUNK_LOW_NEXT_NATURE_b12e0v.jpg', 4, 1);
INSERT INTO `product_img` VALUES (410, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931597/W_NIKE_DUNK_LOW_NEXT_NATURE_xlxqe4.jpg', 5, 1);
INSERT INTO `product_img` VALUES (411, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931772/W_NIKE_DUNK_LOW_NEXT_NATURE_m4gfsj.jpg', 0, 1);
INSERT INTO `product_img` VALUES (412, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931644/W_NIKE_DUNK_LOW_NEXT_NATURE_yezyvt.jpg', 1, 1);
INSERT INTO `product_img` VALUES (413, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931695/W_NIKE_DUNK_LOW_NEXT_NATURE_a2xsbn.jpg', 2, 1);
INSERT INTO `product_img` VALUES (414, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931753/W_NIKE_DUNK_LOW_NEXT_NATURE_yh3weo.jpg', 3, 1);
INSERT INTO `product_img` VALUES (415, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931678/W_NIKE_DUNK_LOW_NEXT_NATURE_lkzkx9.jpg', 4, 1);
INSERT INTO `product_img` VALUES (416, 37, 11, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931812/W_NIKE_DUNK_LOW_NEXT_NATURE_dp4qgl.jpg', 5, 1);

-- ----------------------------
-- Table structure for product_main_img
-- ----------------------------
DROP TABLE IF EXISTS `product_main_img`;
CREATE TABLE `product_main_img`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_product_main`(`product_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_main_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_main_img
-- ----------------------------
INSERT INTO `product_main_img` VALUES (2, 3, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888802/AIR_JORDAN_1_LOW_SEMain_jplbbr.avif');
INSERT INTO `product_main_img` VALUES (12, 1, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768888620/WMNS_AIR_JORDAN_1_LOWM_omav9l.avif');
INSERT INTO `product_main_img` VALUES (13, 4, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768911723/AIR_JORDAN_1_LOW_nocz0l.jpg');
INSERT INTO `product_main_img` VALUES (14, 5, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768915627/AIR_JORDAN_1_LOW_SE_28GS_29_nls7t9.jpg');
INSERT INTO `product_main_img` VALUES (15, 6, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768916086/WMNS_AIR_JORDAN_1_MM_LOW_V3_njsgj0.jpg');
INSERT INTO `product_main_img` VALUES (16, 7, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917019/AIR_JORDAN_1_LOW_SE_28GS_29_rxc57q.jpg');
INSERT INTO `product_main_img` VALUES (17, 8, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768917877/JORDAN_1_LOW_ALT_SS_28PS_29_ummsyt.jpg');
INSERT INTO `product_main_img` VALUES (18, 9, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918102/JORDAN_1_LOW_ALT_SE_28PS_29_osydl4.jpg');
INSERT INTO `product_main_img` VALUES (19, 10, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918333/JORDAN_NU_RETRO_1_G_bzziks.jpg');
INSERT INTO `product_main_img` VALUES (20, 11, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768918818/W_AIR_JORDAN_1_BROOKLYN_LOW_evyq3z.jpg');
INSERT INTO `product_main_img` VALUES (21, 12, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922306/AIR_FORCE_1_2707_LV8_kpqifc.jpg');
INSERT INTO `product_main_img` VALUES (22, 13, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922831/W_AIR_FORCE_1_2707_MINI_JEWEL_m1maht.jpg');
INSERT INTO `product_main_img` VALUES (23, 14, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768922954/AIR_FORCE_1_2707_ac8kbp.jpg');
INSERT INTO `product_main_img` VALUES (24, 15, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923502/W_AIR_FORCE_1_2707_PRM_egauiy.jpg');
INSERT INTO `product_main_img` VALUES (25, 16, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768923864/W_AIR_FORCE_1_2707_SE_zpqspk.jpg');
INSERT INTO `product_main_img` VALUES (26, 17, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924054/AIR_FORCE_1_GTX_VIBRAM_fnq6cp.jpg');
INSERT INTO `product_main_img` VALUES (27, 18, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768924319/AIR_FORCE_1_2707_yhelx8.jpg');
INSERT INTO `product_main_img` VALUES (28, 19, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925312/FORCE_1_LOW_EASYON_28PS_29_svastj.jpg');
INSERT INTO `product_main_img` VALUES (29, 20, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768925624/AIR_FORCE_1_28GS_29_avnkzx.jpg');
INSERT INTO `product_main_img` VALUES (30, 21, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926111/AIR_FORCE_1_V_28GS_29_cpzje3.jpg');
INSERT INTO `product_main_img` VALUES (31, 22, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768926345/M_NIKE_METCON_10_uleukn.jpg');
INSERT INTO `product_main_img` VALUES (32, 23, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927010/W_NIKE_METCON_10_SE_waj3ub.jpg');
INSERT INTO `product_main_img` VALUES (33, 24, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927173/W_NIKE_METCON_10_AMP_rum0x9.jpg');
INSERT INTO `product_main_img` VALUES (34, 25, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768927461/NIKE_FREE_METCON_6_us1lxd.jpg');
INSERT INTO `product_main_img` VALUES (35, 26, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928086/W_NIKE_FREE_METCON_6_SE_hnmwxa.jpg');
INSERT INTO `product_main_img` VALUES (36, 27, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928261/W_NIKE_FREE_METCON_6_AMP_qsfw08.jpg');
INSERT INTO `product_main_img` VALUES (37, 28, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928490/SABRINA_3_GAMER_EP_jgvcvl.jpg');
INSERT INTO `product_main_img` VALUES (38, 29, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768928691/SABRINA_3_EP_obvdco.jpg  ');
INSERT INTO `product_main_img` VALUES (39, 30, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929443/SABRINA_3_EP_debxjo.jpg');
INSERT INTO `product_main_img` VALUES (40, 31, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929692/SABRINA_3_KC_28GS_29_ll0byl.jpg');
INSERT INTO `product_main_img` VALUES (41, 32, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768929928/NIKE_DUNK_LOW_RETRO_mtaj81.jpg');
INSERT INTO `product_main_img` VALUES (42, 33, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930105/NIKE_SB_DUNK_LOW_PRO_u3eggd.jpg');
INSERT INTO `product_main_img` VALUES (43, 34, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930497/NIKE_DUNK_LOW_RETRO_SE_n9kxdd.jpg');
INSERT INTO `product_main_img` VALUES (44, 35, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768930851/WMNS_NIKE_DUNK_LOW_zujali.jpg');
INSERT INTO `product_main_img` VALUES (45, 36, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931264/NIKE_DUNK_LOW_RETRO_LTD_HWN_i4oy1b.jpg');
INSERT INTO `product_main_img` VALUES (46, 37, 1, 'https://res.cloudinary.com/dnmowplwi/image/upload/v1768931583/W_NIKE_DUNK_LOW_NEXT_NATURE_ikgf1c.jpg');

-- ----------------------------
-- Table structure for product_variant
-- ----------------------------
DROP TABLE IF EXISTS `product_variant`;
CREATE TABLE `product_variant`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `size_id` int UNSIGNED NOT NULL,
  `color_id` int UNSIGNED NOT NULL,
  `stock` int NOT NULL,
  `is_discontinue_variant` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id` ASC, `size_id` ASC, `color_id` ASC) USING BTREE,
  UNIQUE INDEX `unique_variant`(`product_id` ASC, `size_id` ASC, `color_id` ASC) USING BTREE,
  INDEX `size_id`(`size_id` ASC) USING BTREE,
  INDEX `color_id`(`color_id` ASC) USING BTREE,
  CONSTRAINT `product_variant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_variant_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_variant_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 854 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variant
-- ----------------------------
INSERT INTO `product_variant` VALUES (1, 1, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (2, 1, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (3, 1, 8, 11, 100, 0);
INSERT INTO `product_variant` VALUES (4, 1, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (5, 1, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (6, 1, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (7, 1, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (8, 1, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (9, 1, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (10, 1, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (25, 1, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (26, 1, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (27, 1, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (28, 1, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (29, 1, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (30, 1, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (31, 1, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (35, 1, 1, 11, 100, 0);
INSERT INTO `product_variant` VALUES (36, 1, 2, 11, 100, 0);
INSERT INTO `product_variant` VALUES (37, 1, 3, 11, 100, 0);
INSERT INTO `product_variant` VALUES (38, 1, 4, 11, 100, 0);
INSERT INTO `product_variant` VALUES (39, 1, 5, 11, 100, 0);
INSERT INTO `product_variant` VALUES (40, 1, 6, 11, 100, 0);
INSERT INTO `product_variant` VALUES (41, 1, 7, 11, 100, 0);
INSERT INTO `product_variant` VALUES (42, 3, 1, 5, 100, 1);
INSERT INTO `product_variant` VALUES (43, 3, 2, 5, 100, 1);
INSERT INTO `product_variant` VALUES (44, 3, 3, 5, 100, 1);
INSERT INTO `product_variant` VALUES (45, 3, 4, 5, 100, 1);
INSERT INTO `product_variant` VALUES (46, 3, 5, 5, 100, 1);
INSERT INTO `product_variant` VALUES (47, 3, 6, 5, 100, 1);
INSERT INTO `product_variant` VALUES (48, 3, 7, 5, 100, 1);
INSERT INTO `product_variant` VALUES (49, 3, 8, 5, 100, 1);
INSERT INTO `product_variant` VALUES (50, 3, 9, 5, 100, 1);
INSERT INTO `product_variant` VALUES (51, 3, 10, 5, 100, 1);
INSERT INTO `product_variant` VALUES (59, 4, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (60, 4, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (61, 4, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (62, 4, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (63, 4, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (64, 4, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (65, 4, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (66, 4, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (67, 4, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (68, 4, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (74, 4, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (75, 4, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (76, 4, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (77, 4, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (78, 4, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (79, 4, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (80, 4, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (81, 4, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (82, 4, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (83, 4, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (89, 4, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (90, 4, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (91, 4, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (92, 4, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (93, 4, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (94, 4, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (95, 4, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (96, 4, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (97, 4, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (98, 4, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (104, 5, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (105, 5, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (106, 5, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (107, 5, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (108, 5, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (109, 5, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (110, 5, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (111, 5, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (112, 5, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (113, 5, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (119, 6, 1, 11, 100, 0);
INSERT INTO `product_variant` VALUES (120, 6, 2, 11, 100, 0);
INSERT INTO `product_variant` VALUES (121, 6, 3, 11, 100, 0);
INSERT INTO `product_variant` VALUES (122, 6, 4, 11, 100, 0);
INSERT INTO `product_variant` VALUES (123, 6, 5, 11, 100, 0);
INSERT INTO `product_variant` VALUES (124, 6, 6, 11, 100, 0);
INSERT INTO `product_variant` VALUES (125, 6, 7, 11, 100, 0);
INSERT INTO `product_variant` VALUES (126, 6, 8, 11, 100, 0);
INSERT INTO `product_variant` VALUES (127, 6, 9, 11, 100, 0);
INSERT INTO `product_variant` VALUES (128, 6, 10, 11, 100, 0);
INSERT INTO `product_variant` VALUES (134, 6, 1, 10, 100, 0);
INSERT INTO `product_variant` VALUES (135, 6, 2, 10, 100, 0);
INSERT INTO `product_variant` VALUES (136, 6, 3, 10, 100, 0);
INSERT INTO `product_variant` VALUES (137, 6, 4, 10, 100, 0);
INSERT INTO `product_variant` VALUES (138, 6, 5, 10, 100, 0);
INSERT INTO `product_variant` VALUES (139, 6, 6, 10, 100, 0);
INSERT INTO `product_variant` VALUES (140, 6, 7, 10, 100, 0);
INSERT INTO `product_variant` VALUES (141, 6, 8, 10, 100, 0);
INSERT INTO `product_variant` VALUES (142, 6, 9, 10, 100, 0);
INSERT INTO `product_variant` VALUES (143, 6, 10, 10, 100, 0);
INSERT INTO `product_variant` VALUES (149, 7, 1, 12, 100, 0);
INSERT INTO `product_variant` VALUES (150, 7, 2, 12, 100, 0);
INSERT INTO `product_variant` VALUES (151, 7, 3, 12, 100, 0);
INSERT INTO `product_variant` VALUES (152, 7, 4, 12, 100, 0);
INSERT INTO `product_variant` VALUES (153, 7, 5, 12, 100, 0);
INSERT INTO `product_variant` VALUES (154, 7, 6, 12, 100, 0);
INSERT INTO `product_variant` VALUES (155, 7, 7, 12, 100, 0);
INSERT INTO `product_variant` VALUES (156, 7, 8, 12, 100, 0);
INSERT INTO `product_variant` VALUES (157, 7, 9, 12, 100, 0);
INSERT INTO `product_variant` VALUES (158, 7, 10, 12, 100, 0);
INSERT INTO `product_variant` VALUES (164, 8, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (165, 8, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (166, 8, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (167, 8, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (168, 8, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (169, 8, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (170, 8, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (171, 8, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (172, 8, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (173, 8, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (179, 9, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (180, 9, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (181, 9, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (182, 9, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (183, 9, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (184, 9, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (185, 9, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (186, 9, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (187, 9, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (188, 9, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (194, 10, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (195, 10, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (196, 10, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (197, 10, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (198, 10, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (199, 10, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (200, 10, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (201, 10, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (202, 10, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (203, 10, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (209, 10, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (210, 10, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (211, 10, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (212, 10, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (213, 10, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (214, 10, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (215, 10, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (216, 10, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (217, 10, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (218, 10, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (224, 11, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (225, 11, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (226, 11, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (227, 11, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (228, 11, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (229, 11, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (230, 11, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (231, 11, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (232, 11, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (233, 11, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (239, 11, 1, 9, 100, 0);
INSERT INTO `product_variant` VALUES (240, 11, 2, 9, 100, 0);
INSERT INTO `product_variant` VALUES (241, 11, 3, 9, 100, 0);
INSERT INTO `product_variant` VALUES (242, 11, 4, 9, 100, 0);
INSERT INTO `product_variant` VALUES (243, 11, 5, 9, 100, 0);
INSERT INTO `product_variant` VALUES (244, 11, 6, 9, 100, 0);
INSERT INTO `product_variant` VALUES (245, 11, 7, 9, 100, 0);
INSERT INTO `product_variant` VALUES (246, 11, 8, 9, 100, 0);
INSERT INTO `product_variant` VALUES (247, 11, 9, 9, 100, 0);
INSERT INTO `product_variant` VALUES (248, 11, 10, 9, 100, 0);
INSERT INTO `product_variant` VALUES (254, 12, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (255, 12, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (256, 12, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (257, 12, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (258, 12, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (259, 12, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (260, 12, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (261, 12, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (262, 12, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (263, 12, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (269, 12, 1, 8, 100, 0);
INSERT INTO `product_variant` VALUES (270, 12, 2, 8, 100, 0);
INSERT INTO `product_variant` VALUES (271, 12, 3, 8, 100, 0);
INSERT INTO `product_variant` VALUES (272, 12, 4, 8, 100, 0);
INSERT INTO `product_variant` VALUES (273, 12, 5, 8, 100, 0);
INSERT INTO `product_variant` VALUES (274, 12, 6, 8, 100, 0);
INSERT INTO `product_variant` VALUES (275, 12, 7, 8, 100, 0);
INSERT INTO `product_variant` VALUES (276, 12, 8, 8, 100, 0);
INSERT INTO `product_variant` VALUES (277, 12, 9, 8, 100, 0);
INSERT INTO `product_variant` VALUES (278, 12, 10, 8, 100, 0);
INSERT INTO `product_variant` VALUES (284, 13, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (285, 13, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (286, 13, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (287, 13, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (288, 13, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (289, 13, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (290, 13, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (291, 13, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (292, 13, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (293, 13, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (299, 14, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (300, 14, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (301, 14, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (302, 14, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (303, 14, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (304, 14, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (305, 14, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (306, 14, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (307, 14, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (308, 14, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (314, 14, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (315, 14, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (316, 14, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (317, 14, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (318, 14, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (319, 14, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (320, 14, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (321, 14, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (322, 14, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (323, 14, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (329, 15, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (330, 15, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (331, 15, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (332, 15, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (333, 15, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (334, 15, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (335, 15, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (336, 15, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (337, 15, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (338, 15, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (344, 15, 1, 10, 100, 0);
INSERT INTO `product_variant` VALUES (345, 15, 2, 10, 100, 0);
INSERT INTO `product_variant` VALUES (346, 15, 3, 10, 100, 0);
INSERT INTO `product_variant` VALUES (347, 15, 4, 10, 100, 0);
INSERT INTO `product_variant` VALUES (348, 15, 5, 10, 100, 0);
INSERT INTO `product_variant` VALUES (349, 15, 6, 10, 100, 0);
INSERT INTO `product_variant` VALUES (350, 15, 7, 10, 100, 0);
INSERT INTO `product_variant` VALUES (351, 15, 8, 10, 100, 0);
INSERT INTO `product_variant` VALUES (352, 15, 9, 10, 100, 0);
INSERT INTO `product_variant` VALUES (353, 15, 10, 10, 100, 0);
INSERT INTO `product_variant` VALUES (359, 16, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (360, 16, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (361, 16, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (362, 16, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (363, 16, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (364, 16, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (365, 16, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (366, 16, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (367, 16, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (368, 16, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (374, 17, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (375, 17, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (376, 17, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (377, 17, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (378, 17, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (379, 17, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (380, 17, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (381, 17, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (382, 17, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (383, 17, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (389, 18, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (390, 18, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (391, 18, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (392, 18, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (393, 18, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (394, 18, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (395, 18, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (396, 18, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (397, 18, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (398, 18, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (404, 19, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (405, 19, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (406, 19, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (407, 19, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (408, 19, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (409, 19, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (410, 19, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (411, 19, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (412, 19, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (413, 19, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (419, 20, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (420, 20, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (421, 20, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (422, 20, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (423, 20, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (424, 20, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (425, 20, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (426, 20, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (427, 20, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (428, 20, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (434, 20, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (435, 20, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (436, 20, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (437, 20, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (438, 20, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (439, 20, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (440, 20, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (441, 20, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (442, 20, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (443, 20, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (449, 21, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (450, 21, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (451, 21, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (452, 21, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (453, 21, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (454, 21, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (455, 21, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (456, 21, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (457, 21, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (458, 21, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (464, 22, 1, 2, 100, 0);
INSERT INTO `product_variant` VALUES (465, 22, 2, 2, 100, 0);
INSERT INTO `product_variant` VALUES (466, 22, 3, 2, 100, 0);
INSERT INTO `product_variant` VALUES (467, 22, 4, 2, 100, 0);
INSERT INTO `product_variant` VALUES (468, 22, 5, 2, 100, 0);
INSERT INTO `product_variant` VALUES (469, 22, 6, 2, 100, 0);
INSERT INTO `product_variant` VALUES (470, 22, 7, 2, 100, 0);
INSERT INTO `product_variant` VALUES (471, 22, 8, 2, 100, 0);
INSERT INTO `product_variant` VALUES (472, 22, 9, 2, 100, 0);
INSERT INTO `product_variant` VALUES (473, 22, 10, 2, 100, 0);
INSERT INTO `product_variant` VALUES (479, 22, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (480, 22, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (481, 22, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (482, 22, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (483, 22, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (484, 22, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (485, 22, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (486, 22, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (487, 22, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (488, 22, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (494, 22, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (495, 22, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (496, 22, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (497, 22, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (498, 22, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (499, 22, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (500, 22, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (501, 22, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (502, 22, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (503, 22, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (509, 23, 1, 12, 100, 0);
INSERT INTO `product_variant` VALUES (510, 23, 2, 12, 100, 0);
INSERT INTO `product_variant` VALUES (511, 23, 3, 12, 100, 0);
INSERT INTO `product_variant` VALUES (512, 23, 4, 12, 100, 0);
INSERT INTO `product_variant` VALUES (513, 23, 5, 12, 100, 0);
INSERT INTO `product_variant` VALUES (514, 23, 6, 12, 100, 0);
INSERT INTO `product_variant` VALUES (515, 23, 7, 12, 100, 0);
INSERT INTO `product_variant` VALUES (516, 23, 8, 12, 100, 0);
INSERT INTO `product_variant` VALUES (517, 23, 9, 12, 100, 0);
INSERT INTO `product_variant` VALUES (518, 23, 10, 12, 100, 0);
INSERT INTO `product_variant` VALUES (524, 24, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (525, 24, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (526, 24, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (527, 24, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (528, 24, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (529, 24, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (530, 24, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (531, 24, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (532, 24, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (533, 24, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (539, 25, 1, 8, 100, 0);
INSERT INTO `product_variant` VALUES (540, 25, 2, 8, 100, 0);
INSERT INTO `product_variant` VALUES (541, 25, 3, 8, 100, 0);
INSERT INTO `product_variant` VALUES (542, 25, 4, 8, 100, 0);
INSERT INTO `product_variant` VALUES (543, 25, 5, 8, 100, 0);
INSERT INTO `product_variant` VALUES (544, 25, 6, 8, 100, 0);
INSERT INTO `product_variant` VALUES (545, 25, 7, 8, 100, 0);
INSERT INTO `product_variant` VALUES (546, 25, 8, 8, 100, 0);
INSERT INTO `product_variant` VALUES (547, 25, 9, 8, 100, 0);
INSERT INTO `product_variant` VALUES (548, 25, 10, 8, 100, 0);
INSERT INTO `product_variant` VALUES (554, 25, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (555, 25, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (556, 25, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (557, 25, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (558, 25, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (559, 25, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (560, 25, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (561, 25, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (562, 25, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (563, 25, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (569, 25, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (570, 25, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (571, 25, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (572, 25, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (573, 25, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (574, 25, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (575, 25, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (576, 25, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (577, 25, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (578, 25, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (584, 26, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (585, 26, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (586, 26, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (587, 26, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (588, 26, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (589, 26, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (590, 26, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (591, 26, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (592, 26, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (593, 26, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (599, 27, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (600, 27, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (601, 27, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (602, 27, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (603, 27, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (604, 27, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (605, 27, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (606, 27, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (607, 27, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (608, 27, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (614, 28, 1, 2, 100, 0);
INSERT INTO `product_variant` VALUES (615, 28, 2, 2, 100, 0);
INSERT INTO `product_variant` VALUES (616, 28, 3, 2, 100, 0);
INSERT INTO `product_variant` VALUES (617, 28, 4, 2, 100, 0);
INSERT INTO `product_variant` VALUES (618, 28, 5, 2, 100, 0);
INSERT INTO `product_variant` VALUES (619, 28, 6, 2, 100, 0);
INSERT INTO `product_variant` VALUES (620, 28, 7, 2, 100, 0);
INSERT INTO `product_variant` VALUES (621, 28, 8, 2, 100, 0);
INSERT INTO `product_variant` VALUES (622, 28, 9, 2, 100, 0);
INSERT INTO `product_variant` VALUES (623, 28, 10, 2, 100, 0);
INSERT INTO `product_variant` VALUES (629, 29, 1, 10, 100, 0);
INSERT INTO `product_variant` VALUES (630, 29, 2, 10, 100, 0);
INSERT INTO `product_variant` VALUES (631, 29, 3, 10, 100, 0);
INSERT INTO `product_variant` VALUES (632, 29, 4, 10, 100, 0);
INSERT INTO `product_variant` VALUES (633, 29, 5, 10, 100, 0);
INSERT INTO `product_variant` VALUES (634, 29, 6, 10, 100, 0);
INSERT INTO `product_variant` VALUES (635, 29, 7, 10, 100, 0);
INSERT INTO `product_variant` VALUES (636, 29, 8, 10, 100, 0);
INSERT INTO `product_variant` VALUES (637, 29, 9, 10, 100, 0);
INSERT INTO `product_variant` VALUES (638, 29, 10, 10, 100, 0);
INSERT INTO `product_variant` VALUES (644, 29, 1, 2, 100, 0);
INSERT INTO `product_variant` VALUES (645, 29, 2, 2, 100, 0);
INSERT INTO `product_variant` VALUES (646, 29, 3, 2, 100, 0);
INSERT INTO `product_variant` VALUES (647, 29, 4, 2, 100, 0);
INSERT INTO `product_variant` VALUES (648, 29, 5, 2, 100, 0);
INSERT INTO `product_variant` VALUES (649, 29, 6, 2, 100, 0);
INSERT INTO `product_variant` VALUES (650, 29, 7, 2, 100, 0);
INSERT INTO `product_variant` VALUES (651, 29, 8, 2, 100, 0);
INSERT INTO `product_variant` VALUES (652, 29, 9, 2, 100, 0);
INSERT INTO `product_variant` VALUES (653, 29, 10, 2, 100, 0);
INSERT INTO `product_variant` VALUES (659, 29, 1, 3, 100, 0);
INSERT INTO `product_variant` VALUES (660, 29, 2, 3, 100, 0);
INSERT INTO `product_variant` VALUES (661, 29, 3, 3, 100, 0);
INSERT INTO `product_variant` VALUES (662, 29, 4, 3, 100, 0);
INSERT INTO `product_variant` VALUES (663, 29, 5, 3, 100, 0);
INSERT INTO `product_variant` VALUES (664, 29, 6, 3, 100, 0);
INSERT INTO `product_variant` VALUES (665, 29, 7, 3, 100, 0);
INSERT INTO `product_variant` VALUES (666, 29, 8, 3, 100, 0);
INSERT INTO `product_variant` VALUES (667, 29, 9, 3, 100, 0);
INSERT INTO `product_variant` VALUES (668, 29, 10, 3, 100, 0);
INSERT INTO `product_variant` VALUES (674, 30, 1, 7, 100, 0);
INSERT INTO `product_variant` VALUES (675, 30, 2, 7, 100, 0);
INSERT INTO `product_variant` VALUES (676, 30, 3, 7, 100, 0);
INSERT INTO `product_variant` VALUES (677, 30, 4, 7, 100, 0);
INSERT INTO `product_variant` VALUES (678, 30, 5, 7, 100, 0);
INSERT INTO `product_variant` VALUES (679, 30, 6, 7, 100, 0);
INSERT INTO `product_variant` VALUES (680, 30, 7, 7, 100, 0);
INSERT INTO `product_variant` VALUES (681, 30, 8, 7, 100, 0);
INSERT INTO `product_variant` VALUES (682, 30, 9, 7, 100, 0);
INSERT INTO `product_variant` VALUES (683, 30, 10, 7, 100, 0);
INSERT INTO `product_variant` VALUES (689, 31, 1, 7, 100, 0);
INSERT INTO `product_variant` VALUES (690, 31, 2, 7, 100, 0);
INSERT INTO `product_variant` VALUES (691, 31, 3, 7, 100, 0);
INSERT INTO `product_variant` VALUES (692, 31, 4, 7, 100, 0);
INSERT INTO `product_variant` VALUES (693, 31, 5, 7, 100, 0);
INSERT INTO `product_variant` VALUES (694, 31, 6, 7, 100, 0);
INSERT INTO `product_variant` VALUES (695, 31, 7, 7, 100, 0);
INSERT INTO `product_variant` VALUES (696, 31, 8, 7, 100, 0);
INSERT INTO `product_variant` VALUES (697, 31, 9, 7, 100, 0);
INSERT INTO `product_variant` VALUES (698, 31, 10, 7, 100, 0);
INSERT INTO `product_variant` VALUES (704, 32, 1, 9, 100, 0);
INSERT INTO `product_variant` VALUES (705, 32, 2, 9, 100, 0);
INSERT INTO `product_variant` VALUES (706, 32, 3, 9, 100, 0);
INSERT INTO `product_variant` VALUES (707, 32, 4, 9, 100, 0);
INSERT INTO `product_variant` VALUES (708, 32, 5, 9, 100, 0);
INSERT INTO `product_variant` VALUES (709, 32, 6, 9, 100, 0);
INSERT INTO `product_variant` VALUES (710, 32, 7, 9, 100, 0);
INSERT INTO `product_variant` VALUES (711, 32, 8, 9, 100, 0);
INSERT INTO `product_variant` VALUES (712, 32, 9, 9, 100, 0);
INSERT INTO `product_variant` VALUES (713, 32, 10, 9, 100, 0);
INSERT INTO `product_variant` VALUES (719, 33, 1, 5, 100, 0);
INSERT INTO `product_variant` VALUES (720, 33, 2, 5, 100, 0);
INSERT INTO `product_variant` VALUES (721, 33, 3, 5, 100, 0);
INSERT INTO `product_variant` VALUES (722, 33, 4, 5, 100, 0);
INSERT INTO `product_variant` VALUES (723, 33, 5, 5, 100, 0);
INSERT INTO `product_variant` VALUES (724, 33, 6, 5, 100, 0);
INSERT INTO `product_variant` VALUES (725, 33, 7, 5, 100, 0);
INSERT INTO `product_variant` VALUES (726, 33, 8, 5, 100, 0);
INSERT INTO `product_variant` VALUES (727, 33, 9, 5, 100, 0);
INSERT INTO `product_variant` VALUES (728, 33, 10, 5, 100, 0);
INSERT INTO `product_variant` VALUES (734, 33, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (735, 33, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (736, 33, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (737, 33, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (738, 33, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (739, 33, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (740, 33, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (741, 33, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (742, 33, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (743, 33, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (749, 34, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (750, 34, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (751, 34, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (752, 34, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (753, 34, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (754, 34, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (755, 34, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (756, 34, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (757, 34, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (758, 34, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (764, 34, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (765, 34, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (766, 34, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (767, 34, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (768, 34, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (769, 34, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (770, 34, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (771, 34, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (772, 34, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (773, 34, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (779, 35, 1, 4, 100, 0);
INSERT INTO `product_variant` VALUES (780, 35, 2, 4, 100, 0);
INSERT INTO `product_variant` VALUES (781, 35, 3, 4, 100, 0);
INSERT INTO `product_variant` VALUES (782, 35, 4, 4, 100, 0);
INSERT INTO `product_variant` VALUES (783, 35, 5, 4, 100, 0);
INSERT INTO `product_variant` VALUES (784, 35, 6, 4, 100, 0);
INSERT INTO `product_variant` VALUES (785, 35, 7, 4, 100, 0);
INSERT INTO `product_variant` VALUES (786, 35, 8, 4, 100, 0);
INSERT INTO `product_variant` VALUES (787, 35, 9, 4, 100, 0);
INSERT INTO `product_variant` VALUES (788, 35, 10, 4, 100, 0);
INSERT INTO `product_variant` VALUES (794, 35, 1, 9, 100, 0);
INSERT INTO `product_variant` VALUES (795, 35, 2, 9, 100, 0);
INSERT INTO `product_variant` VALUES (796, 35, 3, 9, 100, 0);
INSERT INTO `product_variant` VALUES (797, 35, 4, 9, 100, 0);
INSERT INTO `product_variant` VALUES (798, 35, 5, 9, 100, 0);
INSERT INTO `product_variant` VALUES (799, 35, 6, 9, 100, 0);
INSERT INTO `product_variant` VALUES (800, 35, 7, 9, 100, 0);
INSERT INTO `product_variant` VALUES (801, 35, 8, 9, 100, 0);
INSERT INTO `product_variant` VALUES (802, 35, 9, 9, 100, 0);
INSERT INTO `product_variant` VALUES (803, 35, 10, 9, 100, 0);
INSERT INTO `product_variant` VALUES (809, 36, 1, 7, 100, 0);
INSERT INTO `product_variant` VALUES (810, 36, 2, 7, 100, 0);
INSERT INTO `product_variant` VALUES (811, 36, 3, 7, 100, 0);
INSERT INTO `product_variant` VALUES (812, 36, 4, 7, 100, 0);
INSERT INTO `product_variant` VALUES (813, 36, 5, 7, 100, 0);
INSERT INTO `product_variant` VALUES (814, 36, 6, 7, 100, 0);
INSERT INTO `product_variant` VALUES (815, 36, 7, 7, 100, 0);
INSERT INTO `product_variant` VALUES (816, 36, 8, 7, 100, 0);
INSERT INTO `product_variant` VALUES (817, 36, 9, 7, 100, 0);
INSERT INTO `product_variant` VALUES (818, 36, 10, 7, 100, 0);
INSERT INTO `product_variant` VALUES (824, 37, 1, 1, 100, 0);
INSERT INTO `product_variant` VALUES (825, 37, 2, 1, 100, 0);
INSERT INTO `product_variant` VALUES (826, 37, 3, 1, 100, 0);
INSERT INTO `product_variant` VALUES (827, 37, 4, 1, 100, 0);
INSERT INTO `product_variant` VALUES (828, 37, 5, 1, 100, 0);
INSERT INTO `product_variant` VALUES (829, 37, 6, 1, 100, 0);
INSERT INTO `product_variant` VALUES (830, 37, 7, 1, 100, 0);
INSERT INTO `product_variant` VALUES (831, 37, 8, 1, 100, 0);
INSERT INTO `product_variant` VALUES (832, 37, 9, 1, 100, 0);
INSERT INTO `product_variant` VALUES (833, 37, 10, 1, 100, 0);
INSERT INTO `product_variant` VALUES (839, 37, 1, 11, 100, 0);
INSERT INTO `product_variant` VALUES (840, 37, 2, 11, 100, 0);
INSERT INTO `product_variant` VALUES (841, 37, 3, 11, 100, 0);
INSERT INTO `product_variant` VALUES (842, 37, 4, 11, 100, 0);
INSERT INTO `product_variant` VALUES (843, 37, 5, 11, 100, 0);
INSERT INTO `product_variant` VALUES (844, 37, 6, 11, 100, 0);
INSERT INTO `product_variant` VALUES (845, 37, 7, 11, 100, 0);
INSERT INTO `product_variant` VALUES (846, 37, 8, 11, 100, 0);
INSERT INTO `product_variant` VALUES (847, 37, 9, 11, 100, 0);
INSERT INTO `product_variant` VALUES (848, 37, 10, 11, 100, 0);

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount_value` decimal(10, 2) NOT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_promotion_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  UNIQUE INDEX `unique_promotion_slug`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion
-- ----------------------------
INSERT INTO `promotion` VALUES (1, 'Jordan', 'Fixed', 500000.00, NULL, NULL, 1, 'jordan-flash-sale');
INSERT INTO `promotion` VALUES (2, 'BlackFriday', 'PERCENTAGE', 50.00, NULL, NULL, 1, 'black-friday');

-- ----------------------------
-- Table structure for promotion_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_product`;
CREATE TABLE `promotion_product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `promotion_id`(`promotion_id` ASC, `product_id` ASC) USING BTREE,
  UNIQUE INDEX `unique_promotion_product`(`promotion_id` ASC, `product_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `promotion_product_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `promotion_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotion_product
-- ----------------------------
INSERT INTO `promotion_product` VALUES (1, 1, 1);
INSERT INTO `promotion_product` VALUES (2, 1, 3);
INSERT INTO `promotion_product` VALUES (3, 1, 4);
INSERT INTO `promotion_product` VALUES (4, 1, 5);
INSERT INTO `promotion_product` VALUES (5, 1, 6);
INSERT INTO `promotion_product` VALUES (6, 1, 7);
INSERT INTO `promotion_product` VALUES (7, 1, 8);
INSERT INTO `promotion_product` VALUES (8, 1, 9);
INSERT INTO `promotion_product` VALUES (9, 1, 10);
INSERT INTO `promotion_product` VALUES (10, 1, 11);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES (1, '38', 1);
INSERT INTO `size` VALUES (2, '39', 2);
INSERT INTO `size` VALUES (3, '40', 3);
INSERT INTO `size` VALUES (4, '41', 4);
INSERT INTO `size` VALUES (5, '42', 5);
INSERT INTO `size` VALUES (6, '43', 6);
INSERT INTO `size` VALUES (7, '44', 7);
INSERT INTO `size` VALUES (8, '45', 8);
INSERT INTO `size` VALUES (9, '46', 9);
INSERT INTO `size` VALUES (10, '47', 10);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `firebase_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'nakroth1504@gmail.com', '', NULL, '', 'user', 'Bazack', 1, '2026-01-20 16:29:48', 'HPoq74pVpNbYRIU5BT1XFIuFhDo2');
INSERT INTO `users` VALUES (3, '23130023@st.hcmuaf.edu.vn', '$2a$12$myhd3dOFRzPfADjIgNMfk.2l6gL/mj/i74XNbnu0qJ78ns50q.tba', '0332536278', 'HCM', 'user', 'Lê Phi Hùng', 1, '2026-01-20 16:40:19', NULL);

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `added_at` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_user_product`(`user_id` ASC, `product_id` ASC) USING BTREE,
  INDEX `fk_wishlist_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
