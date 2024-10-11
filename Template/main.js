// Burger menus
document.addEventListener('DOMContentLoaded', function() {
    // open
    const burger = document.querySelectorAll('.navbar-burger');
    const menu = document.querySelectorAll('.navbar-menu');

    if (burger.length && menu.length) {
        for (var i = 0; i < burger.length; i++) {
            burger[i].addEventListener('click', function() {
                for (var j = 0; j < menu.length; j++) {
                    menu[j].classList.toggle('hidden');
                }
            });
        }
    }

    // close
    const close = document.querySelectorAll('.navbar-close');
    const backdrop = document.querySelectorAll('.navbar-backdrop');

    if (close.length) {
        for (var i = 0; i < close.length; i++) {
            close[i].addEventListener('click', function() {
                for (var j = 0; j < menu.length; j++) {
                    menu[j].classList.toggle('hidden');
                }
            });
        }
    }

    if (backdrop.length) {
        for (var i = 0; i < backdrop.length; i++) {
            backdrop[i].addEventListener('click', function() {
                for (var j = 0; j < menu.length; j++) {
                    menu[j].classList.toggle('hidden');
                }
            });
        }
    }
});
window.addEventListener('scroll', function() {
    var navbar = document.getElementById('navbar');
    if (window.pageYOffset > 0) {
        navbar.classList.add('shadow-md', 'bg-white');
        navbar.classList.remove('bg-gray-100');
    } else {
        navbar.classList.remove('shadow-md', 'bg-white');
        navbar.classList.add('bg-gray-100');
    }
});

// Feaute Laptop Animation
let defaultTransform = 0;
const prev = document.getElementById('prev');
function goNext() {
    var prev = document.getElementById('prev');
    defaultTransform = defaultTransform - 398;
    var slider = document.getElementById("slider");
    if (Math.abs(defaultTransform) >= slider.scrollWidth / 1.7) defaultTransform = 0;
    slider.style.transform = "translateX(" + defaultTransform + "px)";
    prev.classList.remove('invisible');
}
next.addEventListener("click", goNext);
function goPrev() {
    var slider = document.getElementById("slider");
    if (Math.abs(defaultTransform) === 0) defaultTransform = 0;
    else defaultTransform = defaultTransform + 398;
    slider.style.transform = "translateX(" + defaultTransform + "px)";
}
prev.addEventListener("click", () => {
    goPrev();
    if(defaultTransform === 0) return prev.classList.add('invisible');
});

// Feature Mobile Animation
let defaultTransformMobile = 0;
const nextMobile = document.getElementById("nextMobile");
const prevMobile = document.getElementById("prevMobile");
function goNextMobile() {
    defaultTransformMobile = defaultTransformMobile - 398;
    var slider = document.getElementById("sliderMobile");
    if (Math.abs(defaultTransformMobile) >= slider.scrollWidth / 1.7) defaultTransformMobile = 0;
    slider.style.transform = "translateX(" + defaultTransformMobile + "px)";
    prevMobile.classList.remove('invisible');
}
nextMobile.addEventListener("click", goNextMobile);
function goPrevMobile() {
    var slider = document.getElementById("sliderMobile");
    if (Math.abs(defaultTransformMobile) === 0) defaultTransform = 0;
    else defaultTransformMobile = defaultTransformMobile + 398;
    slider.style.transform = "translateX(" + defaultTransformMobile + "px)";
}
prevMobile.addEventListener("click", () => {
    goPrevMobile();
    if(defaultTransformMobile === 0) return prevMobile.classList.add('invisible');
});

// Feature Keyboard Animation 

let defaultTransformKeyboard = 0;
const nextKeyboards = document.getElementById("nextKeyboards");
const prevKeyboards = document.getElementById("prevKeyboards");
function goNextKeyboard() {
    defaultTransformKeyboard = defaultTransformKeyboard - 398;
    var slider = document.getElementById("sliderKeyboards");
    if (Math.abs(defaultTransformKeyboard) >= slider.scrollWidth / 1.7) defaultTransformKeyboard = 0;
    slider.style.transform = "translateX(" + defaultTransformKeyboard + "px)";
    prevKeyboards.classList.remove("invisible");
}
nextKeyboards.addEventListener("click", goNextKeyboard);
function goPrevKeyboard() {
    var slider = document.getElementById("sliderKeyboards");
    if (Math.abs(defaultTransformKeyboard) === 0) defaultTransformKeyboard = 0;
    else defaultTransformKeyboard = defaultTransformKeyboard + 398;
    slider.style.transform = "translateX(" + defaultTransformKeyboard + "px)";
}
prevKeyboards.addEventListener("click", () => {
    goPrevKeyboard();
    if(defaultTransformKeyboard === 0 ) return prevKeyboards.classList.add("invisible");
});

// Feature Monitor Animation 

let defaultTransformMonitor = 0;
const nextMonitor = document.getElementById("nextMonitor");
const prevMonitor = document.getElementById("prevMonitor");
function goNextMonitor() {
    defaultTransformMonitor = defaultTransformMonitor - 398;
    var slider = document.getElementById("sliderMonitor");
    if (Math.abs(defaultTransformMonitor) >= slider.scrollWidth / 1.7) defaultTransformMonitor = 0;
    slider.style.transform = "translateX(" + defaultTransformMonitor + "px)";
    prevMonitor.classList.remove("invisible");
}
nextMonitor.addEventListener("click", goNextMonitor);
function goPrevMonitor() {
    var slider = document.getElementById("sliderMonitor");
    if (Math.abs(defaultTransformMonitor) === 0) defaultTransformMonitor = 0;
    else defaultTransformMonitor = defaultTransformMonitor + 398;
    slider.style.transform = "translateX(" + defaultTransformMonitor + "px)";
}
prevMonitor.addEventListener("click", () => {
    goPrevMonitor();
    if(defaultTransformMonitor === 0 ) return prevMonitor.classList.add("invisible");
});
window.addEventListener('load', function () {
    window.HSSelectCustom.init();
});

// Show Password
const showPasswordCheckBox = document.getElementById('showPassword');
const hiddenPassword = document.getElementById('remember');
const passwordInput = document.getElementById('password');
showPasswordCheckBox.addEventListener('change',(e) => {
    passwordInput.type = e.target.checked ? 'text' : 'password';
    hiddenPassword.textContent = e.target.checked ? 'Ẩn mật khẩu' : 'Hiện mật khẩu';
})
const iconPassword = document.getElementById('iconPassword');
const passwordResign = document.getElementById('passwordFirst');
let isPassword = false;
iconPassword.addEventListener('click', () => {
    isPassword = !isPassword;
    passwordResign.type = isPassword ? 'text' : 'password';
})
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