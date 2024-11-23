// signIn Modal
const signInModal = document.getElementById('authentication-modal');
const openModalButtons = document.querySelectorAll('[data-modal-target="authentication-modal"]');
const closeModalButtons = document.querySelectorAll('[data-modal-hide="authentication-modal"]');

// Hàm mở modal
const openModal = () => {
    signInModal.classList.remove('hidden');
    signInModal.classList.add('flex');

    // Thêm timeout để animation hoạt động
    setTimeout(() => {
        signInModal.classList.add('translate-y-0');
        signInModal.classList.remove('-translate-y-full');
    }, 10);
};

// Hàm đóng modal
const closeModal = () => {
    signInModal.classList.add('-translate-y-full');
    signInModal.classList.remove('translate-y-0');

    setTimeout(() => {
        signInModal.classList.add('hidden');
        signInModal.classList.remove('flex');
    }, 300);
};

// Thêm event listeners cho tất cả các nút mở modal
openModalButtons.forEach(button => {
    button.addEventListener('click', openModal);
});

// Thêm event listeners cho tất cả các nút đóng modal
closeModalButtons.forEach(button => {
    button.addEventListener('click', closeModal);
});

// Đóng modal khi click ra ngoài
signInModal.addEventListener('click', (e) => {
    if (e.target === signInModal) {
        closeModal();
    }
});

// Đóng modal khi nhấn ESC
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && !signInModal.classList.contains('hidden')) {
        closeModal();
    }
});
// Resign Modal
const resignModal = document.getElementById('signup-modal');
const openModalButtonsResign = document.querySelectorAll('[data-modal-target="signup-modal"]');
const closeModalButtonsResign = document.querySelectorAll('[data-modal-hide="signup-modal"]');

// Hàm mở modal
const openModalResign = () => {
    resignModal.classList.remove('hidden');
    resignModal.classList.add('flex');

    // Thêm timeout để animation hoạt động
    setTimeout(() => {
        resignModal.classList.add('translate-y-0');
        resignModal.classList.remove('-translate-y-full');
    }, 10);
};

// Hàm đóng modal
const closeModalResign = () => {
    resignModal.classList.add('-translate-y-full');
    resignModal.classList.remove('translate-y-0');

    setTimeout(() => {
        resignModal.classList.add('hidden');
        resignModal.classList.remove('flex');
    }, 300);
};

// Thêm event listeners cho tất cả các nút mở modal
openModalButtonsResign.forEach(button => {
    button.addEventListener('click', openModalResign);
});

// Thêm event listeners cho tất cả các nút đóng modal
closeModalButtonsResign.forEach(button => {
    button.addEventListener('click', closeModalResign);
});

// Đóng modal khi click ra ngoài
resignModal.addEventListener('click', (e) => {
    if (e.target === resignModal) {
        closeModalResign();
    }
});

// Đóng modal khi nhấn ESC
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && !resignModal.classList.contains('hidden')) {
        closeModalResign();
    }
});

document.addEventListener('DOMContentLoaded', function () {
    const menuButton = document.getElementById('menu-button');
    const dropdownMenu = document.getElementById('dropdown-menu');

    menuButton.addEventListener('click', function () {
        if (dropdownMenu.classList.contains('hidden')) {
            // Show menu
            dropdownMenu.classList.remove('hidden');
            setTimeout(() => {
                dropdownMenu.classList.add('dropdown-enter');
                dropdownMenu.classList.remove('opacity-0', 'scale-95', 'translate-y-2');
            }, 20); // Small delay to ensure the initial state is applied before animating
        } else {
            // Hide menu
            dropdownMenu.classList.add('dropdown-exit');
            dropdownMenu.classList.remove('dropdown-enter');
            setTimeout(() => {
                dropdownMenu.classList.add('hidden');
                dropdownMenu.classList.remove('dropdown-exit');
                dropdownMenu.classList.add('opacity-0', 'scale-95', 'translate-y-2');
            }, 300); // Match this with the CSS transition duration
        }
    });
});

// Search Input Iphone
document.addEventListener('DOMContentLoaded', function () {
    var searchInput = document.getElementById('search');
    var searchForm = document.getElementById('searchForm');
    var timer;

    searchInput.addEventListener('keyup', function () {
        clearTimeout(timer);
        timer = setTimeout(function () {
            searchForm.submit();
        }, 500); // Đợi 500ms sau khi người dùng ngừng gõ
    });
});

// Login
document.getElementById('loginForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const successSingin = document.getElementById('successSingin');
    const errorSignin = document.getElementById('errorSignin');

    var formData = new FormData(this);

    fetch('/InfomationUser/Signin', {
        method: 'POST',
        body: formData,
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.href = data.redirectUrl;
            } else {
                errorSignin.classList.remove('hidden');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
// Resign
document.getElementById('registerForm').addEventListener('submit', function (e) {
    const errorMess = document.getElementById('errorMessage');
    const successMess = document.getElementById('succesMessage');
    e.preventDefault();

    var formData = new FormData(this);

    fetch('/InfomationUser/Register', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                succesMessage.classList.remove('hidden');
                setTimeout(function () {
                    window.location.href = data.redirectUrl;
                }, 2000);
            } else {
                errorMess.classList.remove('hidden');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

window.onload = function () {
    ShowCount();
}

document.getElementById('user').addEventListener('input', function () {
    const user = this.value;
    const userError = document.getElementById('userError');

    if (user.length == 0) {
        userError.textContent = "Họ tên không được để trống";
    }
    else {
        userError.textContent = "";
    }
})

document.getElementById('address').addEventListener('input', function () {
    const address = this.value;
    const addressError = document.getElementById('addressError');
    if (address.length == 0) {
        addressError.textContent = "Địa chỉ không được để trống";
    } else {
        addressError.textContent = "";
    }
})

document.getElementById('emailFirst').addEventListener('input', function () {
    const email = this.value.trim();
    const emailError = document.getElementById('emailFirstError');

    // Kiểm tra nếu email trống
    if (email.length == 0) {
        emailError.textContent = "Không được để trống email";
    }
    // Kiểm tra email có kết thúc bằng @gmail.com
    else if (!email.endsWith('@gmail.com')) {
        emailError.textContent = "Địa chỉ email không đúng định dạng (Đúng định dạng: example@gmail.com)";
    }
    // Nếu đúng, xóa thông báo lỗi
    else {
        emailError.textContent = "";
    }
});

document.getElementById('numberPhone').addEventListener('input', function () {
    const numberPhone = this.value;
    const numberPhoneError = document.getElementById('numberPhoneError');
    if (numberPhone.length == 0) {
        numberPhoneError.textContent = "Số điện thoại không được để trống";
    } else if (!/^(\+84|0)[0-9]{9}$/.test(numberPhone)) {
        numberPhoneError.textContent = "Số điện thoại không đúng định dạng";
    } else {
        numberPhoneError.textContent = "";
    }
})

// Hàm kiểm tra độ mạnh của mật khẩu
document.getElementById('passwordFirst').addEventListener('input', function () {
    const password = this.value;
    const passwordError = document.getElementById('passwordError');

    // Kiểm tra các điều kiện độ mạnh của mật khẩu
    if (password.length < 8) {
        passwordError.textContent = 'Mật khẩu phải có ít nhất 8 ký tự.';
    } else if (!/[A-Z]/.test(password)) {
        passwordError.textContent = 'Mật khẩu phải có ít nhất một chữ hoa.';
    } else if (!/[a-z]/.test(password)) {
        passwordError.textContent = 'Mật khẩu phải có ít nhất một chữ thường.';
    } else if (!/[0-9]/.test(password)) {
        passwordError.textContent = 'Mật khẩu phải có ít nhất một chữ số.';
    } else if (!/[@@!#$%^&*]/.test(password)) {
        passwordError.textContent = ("'Mật khẩu phải có ít nhất một ký tự đặc biệt (!@@#$%^&*).'");
    } else {
        passwordError.textContent = ''; // Xóa thông báo lỗi nếu mật khẩu hợp lệ
    }
});
