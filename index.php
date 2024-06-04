<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #dee2e6;
        }
        .card-body {
            padding: 15px;
            background-color: #fff;
        }
        .card-title {
            font-size: 1.25rem;
            margin-bottom: 10px;
            color: #333;
        }
        .card-text {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 10px;
        }
        .btn-success {
            font-size: 0.9rem;
            font-weight: bold;
        }
        .modal-header {
            background-color: #28a745;
            color: #fff;
        }
        .modal-title {
            font-size: 1.25rem;
        }
        .modal-footer .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }
        .modal-footer .btn-success {
            background-color: #28a745;
            color: #fff;
        }
    </style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2FC04_rnwt3_2Ok2QLh2dyoRSxzzueCMCw&s" width="50" height="50" class="d-inline-block align-top" alt="">
        LICERA TECH
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="">Products <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="it28-admin/address/payment.php">Payment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="it28-admin/address/address.php">Address</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<body>
    <div id="productsDisplay" class="card-grid"></div>
    
    <!-- Modal -->
    <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalLabel">Product Added to Cart</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="modalProductId"></p>
                    <p id="modalProductName"></p>
                    <p id="modalProductPrice"></p>
                    <label for="quantityInput">Quantity:</label>
                    <input type="number" id="quantityInput" value="1" min="1">
                    <p id="modalTotalPrice"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="#" id="buyNowButton" class="btn btn-success">Buy Now</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    fetch('./products/products-api.php')
        .then(response => response.json())
        .then(data => {
            const productsContainer = document.getElementById('productsDisplay');
            data.forEach(product => {
                const cardHTML = `
                    <div class="card">
                        <img class="card-img-top" src="${product.img}" alt="${product.product_name}">
                        <div class="card-body">
                            <p>${product.product_id}</p>
                            <h5 class="card-title">${product.product_name}</h5><br>Price: ₱${product.rrp}<br>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Quantity: ${product.quantity}</p>
                            <button class="btn btn-success" onclick="addToCart(${product.product_id}, '${product.product_name}', ${product.rrp})">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </div>
                    </div>
                `;
                productsContainer.innerHTML += cardHTML;
            });
        })
        .catch(error => console.error('Error:', error));

    let cart = {};

    function addToCart(productId, productName, productPrice) {
        if (cart[productId]) {
            cart[productId]++;
        } else {
            cart[productId] = 1;
        }
        showModal(productId, productName, productPrice);
    }

    function showModal(productId, productName, productPrice) {
        document.getElementById('modalProductId').innerText = `Product ID: ${productId}`;
        document.getElementById('modalProductName').innerText = `Product Name: ${productName}`;
        document.getElementById('modalProductPrice').innerText = `Price: ₱${productPrice}`;
        document.getElementById('quantityInput').value = 1;
        updateTotalPrice(productPrice);

        const buyNowButton = document.getElementById('buyNowButton');
        document.getElementById('quantityInput').addEventListener('input', function() {
            updateTotalPrice(productPrice);
        });

        buyNowButton.onclick = function() {
            const quantity = document.getElementById('quantityInput').value;
            const totalPrice = productPrice * quantity;
            const href = `it28-admin/address/payment.php?product_id=${productId}&product_name=${encodeURIComponent(productName)}&price=${productPrice}&quantity=${quantity}&total_price=${totalPrice}`;
            window.location.href = href;
        };

        $('#cartModal').modal('show');
    }

    function updateTotalPrice(productPrice) {
        const quantity = parseInt(document.getElementById('quantityInput').value);
        const totalPrice = productPrice * quantity;
        document.getElementById('modalTotalPrice').innerText = `Total Price: ₱${totalPrice}`;
    }
    </script>

</body>
</html>
