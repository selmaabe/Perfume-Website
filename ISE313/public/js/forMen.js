// Function to fetch products and display them
async function fetchForMenProducts() {
  try {
    const response = await fetch("/products/forMen");
    const products = await response.json();

    const productContainer = document.getElementById("productContainer");
    productContainer.innerHTML = ""; // Clear any existing products

    // Loop through the products and add them to the page
    products.forEach((product) => {
      const productElement = document.createElement("div");
      productElement.classList.add("product-item");

      // Create HTML structure for each product
      productElement.innerHTML = `
                        <div class="product-image">
                            <img src="${product.img_url}" alt="${product.name}">
                        </div>
                        <div class="product-name">
                            <h3>${product.name}</h3>
                        </div>
                    `;

      // Append the product to the container
      productContainer.appendChild(productElement);
    });
  } catch (error) {
    console.error("Error fetching products:", error);
  }
}

// Fetch products when the page loads
window.onload = fetchForMenProducts;