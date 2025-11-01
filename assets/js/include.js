async function loadComponent(id, file) {
  try {
    const response = await fetch(file);
    if (!response.ok) {
      throw new Error(`Không thể tải ${file}`);
    }
    document.getElementById(id).innerHTML = await response.text();
  } catch (error) {
    console.error("Lỗi khi tải component:", error);
  }
}

document.addEventListener("DOMContentLoaded", () => {
  // Sửa ở đây: Xóa ../
  loadComponent("header", "components/header.html");
  // Sửa ở đây: Xóa ../
  loadComponent("footer", "components/footer.html");
});
