import 'package:ecommerce_app/src/screens/carrito_screen.dart';
import 'package:ecommerce_app/src/screens/login_screen.dart';
import 'package:ecommerce_app/src/screens/tabs.dart';
import 'package:ecommerce_app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:food_delivery_app/src/pages/pick_address.dart';

// import 'src/models/route_argument.dart';
// import 'src/pages/cart.dart';
// import 'src/pages/category.dart';
// import 'src/pages/chat.dart';
// import 'src/pages/checkout.dart';
// import 'src/pages/debug.dart';
// import 'src/pages/delivery_addresses.dart';
// import 'src/pages/delivery_pickup.dart';
// import 'src/pages/details.dart';
// import 'src/pages/favorites.dart';
// import 'src/pages/food.dart';
// import 'src/pages/forget_password.dart';
// import 'src/pages/help.dart';
// import 'src/pages/languages.dart';
// import 'src/pages/login.dart';
// import 'src/pages/menu_list.dart';
// import 'src/pages/order_success.dart';
// import 'src/pages/pages.dart';
// import 'src/pages/payment_methods.dart';
// import 'src/pages/paypal_payment.dart';
// import 'src/pages/profile.dart';
// import 'src/pages/razorpay_payment.dart';
// import 'src/pages/reviews.dart';
// import 'src/pages/settings.dart';
// import 'src/pages/signup.dart';
// import 'src/pages/splash_screen.dart';
// import 'src/pages/tracking.dart';

class RouteGenerator {
  //TODO: app.routing
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments as dynamic;
    print('ARGS: ${settings.name}, ${args}');
    switch (settings.name) {
      // case '/Debug':
      //   return MaterialPageRoute(builder: (_) => DebugWidget(routeArgument: args as RouteArgument));
      case '/Home': //home
        return MaterialPageRoute(builder: (_) => TabsWidget(currentTab: args));
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/Carrito':
        return MaterialPageRoute(
            builder: (_) => CarritoWidget(
                  carritoList: args,
                ));
      // case '/SignUp':
      // return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification2':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/Profile':
      //   return MaterialPageRoute(builder: (_) => ProfileWidget());
      // case '/ForgetPassword':
      //   return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());

      // case '/Favorites':
      //   return MaterialPageRoute(builder: (_) => FavoritesWidget());
      // case '/Chat':
      //   return MaterialPageRoute(builder: (_) => ChatWidget(routeArgument: args as RouteArgument));
      // case '/Details':
      //   return MaterialPageRoute(builder: (_) => DetailsWidget(currentTab: args));
      // case '/Menu':
      //   return MaterialPageRoute(builder: (_) => MenuWidget(routeArgument: args as RouteArgument));
      // case '/Food':
      //   return MaterialPageRoute(builder: (_) => FoodWidget(routeArgument: args as RouteArgument));
      // case '/Category':
      //   return MaterialPageRoute(builder: (_) => CategoryWidget(routeArgument: args as RouteArgument));
      // case '/Cart':
      //   return MaterialPageRoute(builder: (_) => CartWidget(routeArgument: args as RouteArgument));
      // case '/Tracking':
      //   return MaterialPageRoute(builder: (_) => TrackingWidget(routeArgument: args as RouteArgument));
      // case '/Reviews':
      //   return MaterialPageRoute(builder: (_) => ReviewsWidget(routeArgument: args as RouteArgument));
      // case '/PaymentMethod':
      //   return MaterialPageRoute(builder: (_) => PaymentMethodsWidget());
      // case '/DeliveryAddresses':
      //   return MaterialPageRoute(builder: (_) => DeliveryAddressesWidget());
      // case '/DeliveryPickup':
      //   return MaterialPageRoute(builder: (_) => DeliveryPickupWidget(routeArgument: args as RouteArgument));
      // case '/Checkout':
      //   return MaterialPageRoute(builder: (_) => CheckoutWidget());
      // case '/CashOnDelivery':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Cash on Delivery')));
      // case '/PayOnPickup':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Pay on Pickup')));
      // case '/PayPal':
      //   return MaterialPageRoute(builder: (_) => PayPalPaymentWidget(routeArgument: args as RouteArgument));
      // case '/RazorPay':
      //   return MaterialPageRoute(builder: (_) => RazorPayPaymentWidget(routeArgument: args as RouteArgument));
      // case '/OrderSuccess':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: args as RouteArgument));
      // case '/Languages':
      //   return MaterialPageRoute(builder: (_) => LanguagesWidget());
      // case '/Help':
      //   return MaterialPageRoute(builder: (_) => HelpWidget());
      // case '/Settings':
      //   return MaterialPageRoute(builder: (_) => SettingsWidget());

      //   case '/PickAddress':
      //   return MaterialPageRoute(builder: (_) => PickAddressWidget());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
