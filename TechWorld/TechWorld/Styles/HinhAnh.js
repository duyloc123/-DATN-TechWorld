
    // Lấy các phần tử DOM
    const fileInput = document.getElementById('file');
    const previewContainer = document.getElementById('preview-container');
    const previewImg = document.getElementById('preview');
    const dropzone = document.getElementById('dropzone');
    const removeButton = document.getElementById('remove-image');

    // Sự kiện khi chọn file
    fileInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
    if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
    reader.onload = function (e) {
        previewImg.src = e.target.result;
    previewContainer.classList.remove('hidden');
    dropzone.classList.add('hidden');
            }
    reader.readAsDataURL(file);
        }
    });

    // Nút xóa ảnh
    removeButton.addEventListener('click', function () {
        previewContainer.classList.add('hidden');
    dropzone.classList.remove('hidden');
    fileInput.value = ''; // Xóa file đã chọn
    });

    // Kéo thả file
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        dropzone.addEventListener(eventName, preventDefaults, false);
    });

    function preventDefaults(e) {
        e.preventDefault();
    e.stopPropagation();
    }

    ['dragenter', 'dragover'].forEach(eventName => {
        dropzone.addEventListener(eventName, highlight, false);
    });

    ['dragleave', 'drop'].forEach(eventName => {
        dropzone.addEventListener(eventName, unhighlight, false);
    });

    function highlight() {
        dropzone.classList.add('border-blue-500', 'bg-blue-50');
    }

    function unhighlight() {
        dropzone.classList.remove('border-blue-500', 'bg-blue-50');
    }

    dropzone.addEventListener('drop', handleDrop, false);

    function handleDrop(e) {
        const dt = e.dataTransfer;
    const files = dt.files;
        if (files.length > 0 && files[0].type.startsWith('image/')) {
        fileInput.files = files;
    fileInput.dispatchEvent(new Event('change'));
        }
    }