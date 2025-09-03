import '../models/product_model.dart';
import '../models/hot_offer_model.dart';

class SampleDataService {
  static final List<Product> _products = [
    const Product(
      id: '1',
      title: 'Premium Headphones',
      imageUrl:
          'https://img.freepik.com/premium-psd/headphone-brand-product-facebook-cover-banner-design_268949-35.jpg',
      price: 99.99,
      isFeatured: true,
    ),
    const Product(
      id: '2',
      title: 'Smart Watch',
      imageUrl:
          'https://thumbs.dreamstime.com/b/realistic-smart-watch-horizontal-banner-dark-style-advertising-site-vector-illustration-129247047.jpg',
      price: 199.99,
      isFeatured: true,
    ),
    const Product(
      id: '3',
      title: 'Wireless Earbuds',
      imageUrl:
          'https://img.pikbest.com/templates/20250703/wireless-earbuds-facebook-banner-and-social-cover-design_11778538.jpg!w700wp',
      price: 79.99,
      isFeatured: true,
    ),
    const Product(
      id: '4',
      title: 'Bluetooth Speaker',
      imageUrl:
          'https://m.media-amazon.com/images/I/81wdmgabXFL._AC_SL1500_.jpg',
      price: 129.99,
    ),
    const Product(
      id: '5',
      title: 'Gaming Mouse',
      imageUrl:
          'https://target.scene7.com/is/image/Target/GUEST_d06c7d69-046f-4de8-8cf2-29fe0e4fa76a?wid=300&hei=300&fmt=pjpeg',
      price: 59.99,
    ),
    const Product(
      id: '6',
      title: 'Mechanical Keyboard',
      imageUrl:
          'https://media.wired.com/photos/65b0438c22aa647640de5c75/master/pass/Mechanical-Keyboard-Guide-Gear-GettyImages-1313504623.jpg',
      price: 149.99,
    ),
  ];

  static final List<HotOffer> _hotOffers = [
    HotOffer(
      id: '1',
      title: 'Electronics Sale',
      description: '50% OFF on Electronics - Limited Time!',
      imageUrl: 'assets/images/offer1.jpg',
      expiryDate: DateTime.now().add(const Duration(days: 7)),
    ),
    HotOffer(
      id: '2',
      title: 'Accessories Deal',
      description: 'Buy 2 Get 1 Free on All Accessories',
      imageUrl: 'assets/images/offer2.jpg',
      expiryDate: DateTime.now().add(const Duration(days: 14)),
    ),
    HotOffer(
      id: '3',
      title: 'Flash Sale',
      description: 'Flash Sale: Up to 70% Off on Gadgets',
      imageUrl: 'assets/images/offer3.jpg',
      expiryDate: DateTime.now().add(const Duration(days: 3)),
    ),
    HotOffer(
      id: '4',
      title: 'New Customer Special',
      description: 'New Customer Special: Extra 20% Off',
      imageUrl: 'assets/images/offer4.jpg',
      expiryDate: DateTime.now().add(const Duration(days: 30)),
    ),
    HotOffer(
      id: '5',
      title: 'Weekend Deal',
      description: 'Weekend Deal: Free Shipping on Orders Over \$50',
      imageUrl: 'assets/images/offer5.jpg',
      expiryDate: DateTime.now().add(const Duration(days: 2)),
    ),
  ];

  // Get all products
  static List<Product> getAllProducts() {
    return List.unmodifiable(_products);
  }

  // Get featured products only
  static List<Product> getFeaturedProducts() {
    return _products.where((product) => product.isFeatured).toList();
  }

  // Get all hot offers
  static List<HotOffer> getAllHotOffers() {
    return List.unmodifiable(_hotOffers);
  }
}
