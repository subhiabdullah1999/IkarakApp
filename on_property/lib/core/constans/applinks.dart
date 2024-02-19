class AppLinks {
  static const serverName = "https://ikarak.ibits-ltd.me/api";
  static const serverNameImgeThumbnail =
      "https://ikarak.ibits-ltd.me/public/uploads/";
  static const serverNameImgeGelary =
      "https://ikarak.ibits-ltd.me/public/uploads/";

  // authLinks
  static const signup = "$serverName/signup";

  static const otpCode = "$serverName/verify";
  static const login = "$serverName/login";
  static const changePassword = "$serverName/change-password";
  static const deletAccount = "$serverName/delete-account";

  // payment

  static const payment = "$serverName/apply-package";

  // forget Password Links

  static const checkponenumber = "$serverName/ccc";
  static const verfycoderesetpass = "$serverName/vcf";
  static const resetpassword = "$serverName/rp";

  // home screen
  static const rentProp = "$serverName/rent-properties/";
  static const saleProp = "$serverName/sale-properties/";

  static const inversProp = "$serverName/investment-properties/";

  // add Prop links
  static const state = "$serverName/state";
  static const addProp = "$serverName/add-property";
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
  static const getProfile = "$serverName/user-profile/";
  static const getPropUserId = "$serverName/user-properties/";
  static const deletProp = "$serverName/delete-property";

  // adress
  static const addAddress = "$serverName/add-address";
  static const viewAddress = "$serverName/show-address";
  static const deletAddress = "$serverName/delete-address/{addressId}";
}
