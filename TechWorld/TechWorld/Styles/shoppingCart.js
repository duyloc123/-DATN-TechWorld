ShowCount();
function ShowCount() {
    $.ajax({
        url: '/Cart/ShowCount',
        type: 'GET',
        success: function (rs) {
            $('#countProduct').html(rs.Count);
        }
    });
}

const btnAdd = document.getElementById('btnAddToCart');
btnAdd.addEventListener('click', (e) => {
    e.preventDefault();
    var id = document.getElementById('maSP').value;
    var quantityDefault = 1;
    console.log({
        id: id,
        quantity: quantityDefault
    })
    $.ajax({
        url: '/Cart/AddToCart',
        type: 'POST',
        data: { id: id, quantity: quantityDefault },
        success: function (rs) {
            if (rs.Success) {
                $('#countProduct').html(rs.Count);
                alert(rs.msg);
            }
        }
    });
})

function del() {
    let id = document.getElementById("MaSP").value;
    var con = confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng? ");
    if (con == true) {
        $.ajax({
            url: '/Cart/DeleteItem',
            type: 'POST',
            data: { id: id },
            success: function (rs) {
                if (rs.success) {
                    $('#countProduct').html(rs.Count);
                    $('#div_' + id).remove();
                    location.reload();
                }
            }
        });
    }
}