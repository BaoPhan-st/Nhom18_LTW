// File: assets/script/auth.js

// 1. Import chỉ những gì cần thiết cho Google
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
import { getAuth, GoogleAuthProvider, signInWithPopup } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

// 2. Cấu hình Firebase (Của Project login-gg-c46e0)
const firebaseConfig = {
    apiKey: "AIzaSyCihucCpq_GiE6v4sM9ytpVkf9kEub01Os", // Đã sửa số 1 chính xác
    authDomain: "login-gg-c46e0.firebaseapp.com",
    projectId: "login-gg-c46e0",
    storageBucket: "login-gg-c46e0.firebasestorage.app",
    messagingSenderId: "219207162402",
    appId: "1:219207162402:web:011e518cc18341254f887b"
};

// 3. Khởi tạo Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

// 4. Xử lý sự kiện khi tải trang xong
document.addEventListener('DOMContentLoaded', function () {

    // Tìm nút đăng nhập bằng ID (nhớ gắn id="google-login-btn" bên file JSP)
    const googleBtn = document.getElementById('google-login-btn');

    if (googleBtn) {
        googleBtn.addEventListener('click', (e) => {
            e.preventDefault(); // Chặn hành động mặc định của thẻ button/a

            // Bắt đầu đăng nhập Popup
            signInWithPopup(auth, provider)
                .then((result) => {
                    // --- ĐĂNG NHẬP THÀNH CÔNG ---
                    const user = result.user;
                    console.log("Login Google thành công:", user);

                    // Thông báo nhẹ
                    alert("Xin chào: " + user.displayName);

                    // Chuyển hướng sang trang Menu sau đăng nhập
                    window.location.href = "menusaulogin.jsp";
                })
                .catch((error) => {
                    // --- ĐĂNG NHẬP THẤT BẠI ---
                    console.error("Lỗi Google Login:", error);
                    alert("Đăng nhập thất bại: " + error.message);
                });
        });
    } else {
        console.warn("Không tìm thấy nút có id='google-login-btn'. Hãy kiểm tra lại file HTML/JSP.");
    }
});