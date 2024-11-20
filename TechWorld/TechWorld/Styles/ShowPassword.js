// Show Password
const showPasswordCheckBox = document.getElementById('showPassword');
const hiddenPassword = document.getElementById('remember');
const passwordInput = document.getElementById('password');
const showIconPassword = document.getElementById('iconPassword');

showPasswordCheckBox.addEventListener('change', (e) => {
    passwordInput.type = e.target.checked ? 'text' : 'password';
    hiddenPassword.textContent = e.target.checked ? 'Ẩn mật khẩu' : 'Hiện mật khẩu';
})
const iconPassword = document.getElementById('iconPassword');
const passwordResign = document.getElementById('passwordFirst');
let isPassword = false;

iconPassword.addEventListener('click', () => {
    isPassword = !isPassword;
    const srcShowPass = "/styles/image/view.png";
    const srcHiddenPass = "/styles/image/hide.png"

    passwordResign.type = isPassword ? 'text' : 'password';
    iconPassword.src = isPassword ? srcShowPass : srcHiddenPass;

})