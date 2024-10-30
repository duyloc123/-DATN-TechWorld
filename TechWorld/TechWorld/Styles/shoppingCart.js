// Input Number

// Button Quantity

const incrementQuantity = document.getElementById("incrementQuantity");
incrementQuantity.addEventListener('click', () => {
    quantity = Number(quantity) + 1;
})

const decrementQuantity = document.getElementById("decrementQuantity");
decrementQuantity.addEventListener('click', () => {
    if (quantity <= 1) {
        quantity = 1;
    }
    else {
        quantity = Number(quantity) - 1;
    }
})

function decrement(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
        'button[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    value--;
    if (value <= 1) {
        value = 1;
    }
    target.value = value;
}

function increment(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
        'button[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    value++;
    target.value = value;
}

const decrementButtons = document.querySelectorAll(
    `button[data-action="decrement"]`
);

const incrementButtons = document.querySelectorAll(
    `button[data-action="increment"]`
);

decrementButtons.forEach(btn => {
    btn.addEventListener("click", decrement);
});

incrementButtons.forEach(btn => {
    btn.addEventListener("click", increment);
});

// Cart
const addToCart = document.getElementById("btnAddToCart");
const id = document.getElementById("maSP").value;
var quantity = document.getElementById("quantity_value").value;

addToCart.addEventListener('click', (e) => {
    e.preventDefault();
    console.log({
        id: id,
        quantity: quantity
    })
    $.ajax({
        url: "/ShoppingCart/AddToCart",
        type: "POST",
        data: { id: id, quantity: quantity },
        success: function (rs) {
            if (rs.Success) {
                $('#checkout_items').html(rs.Count);
                alert(rs.msg);
            }
        }
    })
})

function DeleteCart(id) {
    var con = confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?");
    if (con == true) {
        $.ajax({
            url: '/ShoppingCart/Delete',
            type: 'POST',
            data: { id: id },
            success: function (rs) {
                if (rs.Success) {
                    $('#checkout_items').html(rs.Count);
                    location.reload();
                }
            }
        });
    }
};

function UpdateCart(id) {
    let quantity = document.getElementById("quantity").value;
    $.ajax({
        url: '/ShoppingCart/Update',
        type: 'POST',
        data: { id: id, quantity: quantity },
        success: function (rs) {
            if (rs.Success) {
                location.reload();
            }
        }
    })
}

// Button Quantity Cart
function incrementCart() {
    let quantityInput = document.getElementById('quantity');
    let currentValue = parseInt(quantityInput.value);

    quantityInput.value = currentValue + 1;
}

function decrementCart() {
    let quantityInput = document.getElementById('quantity');
    let currentValue = parseInt(quantityInput.value);

    if (quantityInput.value <= 1) {
        quantityInput.value = 1;
    } else {
        quantityInput.value = currentValue - 1;
    }
}
