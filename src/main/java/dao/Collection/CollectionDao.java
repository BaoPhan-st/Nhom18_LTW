package dao.Collection;

import dao.JDBIConnector;
import model.Collection.Collection;
import org.jdbi.v3.core.Jdbi;

import java.util.Collections;
import java.util.List;

/**
 * DAO cho Collection - Quản lý các bộ sưu tập sản phẩm
 * 
 * Collection có 2 loại dựa vào ruleSet_type:
 * 1. MANUAL: Admin thêm sản phẩm thủ công qua bảng collection_product
 * 2. AUTO: Sản phẩm tự động dựa trên rules trong bảng collection_rule
 */
public class CollectionDao {

    private final Jdbi jdbi;

    public CollectionDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    /**
     * Tìm collection theo ID
     */
    public Collection findById(int id) {
        String sql = """
                    SELECT * FROM collection
                    WHERE id = :id AND is_active = 1
                """;

        try {
            return jdbi.withHandle(h -> h.createQuery(sql)
                    .bind("id", id)
                    .mapToBean(Collection.class)
                    .findOne()
                    .orElse(null));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Tìm collection theo slug (dùng cho URL)
     * VD: /collection/giay-nike-gia-re
     */
    public Collection findBySlug(String slug) {
        String sql = """
                    SELECT * FROM collection
                    WHERE slug = :slug AND is_active = 1
                """;

        try {
            return jdbi.withHandle(h -> h.createQuery(sql)
                    .bind("slug", slug)
                    .mapToBean(Collection.class)
                    .findOne()
                    .orElse(null));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Lấy tất cả collection đang active
     */
    public List<Collection> findAllActive() {
        String sql = "SELECT * FROM collection WHERE is_active = 1 ORDER BY name";

        try {
            return jdbi.withHandle(h -> h.createQuery(sql)
                    .mapToBean(Collection.class)
                    .list());
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    /**
     * Tạo collection mới
     * 
     * @return ID của collection vừa tạo, -1 nếu lỗi
     */
    public int insert(Collection collection) {
        String sql = """
                    INSERT INTO collection (name, slug, ruleSet_type, is_active)
                    VALUES (:name, :slug, :ruleSetType, :isActive)
                """;

        try {
            return jdbi.withHandle(h -> h.createUpdate(sql)
                    .bind("name", collection.getName())
                    .bind("slug", collection.getSlug())
                    .bind("ruleSetType", collection.getRuleSetType())
                    .bind("isActive", collection.isActive())
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(int.class)
                    .one());
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * Cập nhật collection
     */
    public boolean update(Collection collection) {
        String sql = """
                    UPDATE collection
                    SET name = :name, slug = :slug, ruleSet_type = :ruleSetType, is_active = :isActive
                    WHERE id = :id
                """;

        try {
            int updated = jdbi.withHandle(h -> h.createUpdate(sql)
                    .bind("id", collection.getId())
                    .bind("name", collection.getName())
                    .bind("slug", collection.getSlug())
                    .bind("ruleSetType", collection.getRuleSetType())
                    .bind("isActive", collection.isActive())
                    .execute());
            return updated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xóa mềm collection (set is_active = 0)
     */
    public boolean delete(int id) {
        String sql = "UPDATE collection SET is_active = 0 WHERE id = :id";

        try {
            int updated = jdbi.withHandle(h -> h.createUpdate(sql)
                    .bind("id", id)
                    .execute());
            return updated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Kiểm tra collection có phải Smart Collection không
     * (Smart Collection là collection có ít nhất 1 rule)
     */
    public boolean isSmartCollection(int collectionId) {
        String sql = """
                    SELECT COUNT(*) FROM collection_rule
                    WHERE collection_id = :collectionId
                """;

        try {
            return jdbi.withHandle(h -> h.createQuery(sql)
                    .bind("collectionId", collectionId)
                    .mapTo(int.class)
                    .one() > 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
