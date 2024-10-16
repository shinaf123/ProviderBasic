import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/api_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {

    //Calling Provider 
    final getModel = Provider.of<DataProvider>(context, listen: false);

    //Get The Values Of Provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getModel.getData();
    });

    //UI Screen....................
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(child:
              Expanded(
                child: Consumer<DataProvider>(builder: (context, DataProvider, child) {
                        if (DataProvider.isloading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (DataProvider.data.isEmpty) {
                          return const Center(child: Text('No items found.'));
                        }
                
                        return ListView.builder(

                          //Using Listview.Builder Get data From Api...........
                            itemCount: DataProvider.data.length,
                            itemBuilder: (context, index) {
                final productData = DataProvider.data[index];
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: customListTile(
                      "${productData.title}",
                      "${productData.description}",
                      "${productData.id}-",
                      "${productData.price}",
                      "${productData.images}"
                    
                      ),
                      
                );
                            });
                      }),
              )
         
          ),
    );
  }

  customListTile(String title, String subtitle, String id, String price,String img) {
    return ListTile(
      trailing: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image:NetworkImage(img),fit: BoxFit.cover)
            ),
          ),
          Text(price),
        ],
      ),
      leading: Text(id),
      textColor: Colors.black,
      tileColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
      subtitle: Text(subtitle),
    );
  }
}
