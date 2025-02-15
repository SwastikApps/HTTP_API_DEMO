import 'package:http_api_demo/carts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Carts>> cartData;

  @override
  void initState() {
    super.initState();
    cartData = ApiService().fetchCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: FutureBuilder<List<Carts>>(
        future: cartData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data found"));
          }

          List<Carts> carts = snapshot.data!;
          return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // ✅ Adjusts column height dynamically
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item: " + carts[index].id.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: carts[index].product?.length ?? 0,
                            itemBuilder: (context, productIndex) {
                              final product =
                                  carts[index].product?[productIndex];
                              return Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                // ✅ Add padding for spacing inside the box
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  // ✅ Set background color
                                  borderRadius: BorderRadius.circular(10),
                                  // ✅ Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      // ✅ Soft shadow effect
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      product?.thumbnail ?? "",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(height: 15),
                                    Text(product?.title ?? "",
                                        style: TextStyle(fontSize: 12)),
                                    SizedBox(height: 2),
                                    Text(
                                        "Price : " + product!.price.toString()),
                                    SizedBox(height: 2),
                                    Text("Quantity : " +
                                        product!.quantity.toString()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final List<Products> products;

  ProductScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products in Cart")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(products[index].thumbnail ?? "",
                  width: 50, height: 50, fit: BoxFit.cover),
              title: Text(products[index].title ?? ""),
              subtitle: Text(
                  "Price: \$${products[index].price}, Qty: ${products[index].quantity}"),
            ),
          );
        },
      ),
    );
  }
}
