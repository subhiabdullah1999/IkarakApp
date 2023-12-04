class AppLinks {
  static const serverName = "https://mo.mymealon.com/public/api";

  // authLinks
  static const signup = "$serverName/customer/register";

  static const verifycodesinupandogin = "$serverName/vvvvvvv";
  static const login = "$serverName/customer/login";
  static const changePassword = "$serverName/change-password";
  static const logOut = "$serverName/logout";

  // forget Password Links

  static const checkponenumber = "$serverName/ccc";
  static const verfycoderesetpass = "$serverName/vcf";
  static const resetpassword = "$serverName/rp";

  // home screen
  static const homeApi = "$serverName/home";

  static const subCategoriesHome = "$serverName/sub-categories";
  static const subCategoriesDescrHome = "$serverName/foods-sub-categories/";
  static const searchResturant = "$serverName/home";
  static const sliderOffers = "$serverName/sliders";

  // cart links
  static const viewCart = "$serverName/home";
  static const addCart = "$serverName/add-to-cart/12";
  static const deletCart = "$serverName/delete-cart-item/{cart_item_id}";
  static const deletAllUpComingOrders = "$serverName/clear-carts";
  static const deletAllUpPastOrders = "$serverName/clear-orders";
  static const deletItemFromCart =
      "$serverName/delete-cart-item/{cart_item_id}";

  // subCategories
  static const searchCategories = "$serverName/sub-categories?keyword=one";

  // orders
  static const allOrders = "$serverName/all-orders";

  // profile
  static const editProfile = "$serverName/update-profile";

  // adress
  static const addAddress = "$serverName/add-address";
  static const viewAddress = "$serverName/show-address";
  static const deletAddress = "$serverName/delete-address/{addressId}";
}
