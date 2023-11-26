import 'package:feedplayback/view/HomeView.dart';
import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: Column(
        children: [
          ExpandingCouponTile(
            companyName: 'Estabelecimento A',
            progressPercentage: 50,
            discountDescription: 'Este cupom é de 50% de desconto',
            reviewsCount: 2,
            totalReviews: 4,
          ),
          ExpandingCouponTile(
            companyName: 'Estabelecimento B',
            progressPercentage: 75,
            discountDescription: 'Este cupom é de 30% de desconto',
            reviewsCount: 6,
            totalReviews: 8,
          ),
          ExpandingCouponTile(
            companyName: 'Estabelecimento C',
            progressPercentage: 30,
            discountDescription: 'Este cupom é de 20% de desconto',
            reviewsCount: 3,
            totalReviews: 10,
          ),
          // Adicione mais Tiles conforme necessário
        ],
      ),
    );
  }
}

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contexto) => HomeView(),
            ),
          );
        },
      ),
      title: Text(
        'Carteira digital',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class ExpandingCouponTile extends StatelessWidget {
  final String companyName;
  final int progressPercentage;
  final String discountDescription;
  final int reviewsCount;
  final int totalReviews;

  ExpandingCouponTile({
    required this.companyName,
    required this.progressPercentage,
    required this.discountDescription,
    required this.reviewsCount,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: CouponTile(
          companyName: companyName,
          progressPercentage: progressPercentage,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discountDescription,
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(height: 10),
                    CircularProgressIndicatorWithLabel(
                      progress: reviewsCount / totalReviews,
                      reviewsCount: reviewsCount,
                      totalReviews: totalReviews,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: progressPercentage == 100
                      ? () {
                    // Lógica para utilizar o cupom
                    // Aqui você pode adicionar a lógica de utilização do cupom
                  }
                      : () {
                    // Pop-up se o progresso não estiver concluído
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Cupom não concluído!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Utilizar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    // Desabilitar o botão se o progresso não estiver completo
                    // Modifique conforme necessário
                    // enabled: progressPercentage == 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponTile extends StatelessWidget {
  final String companyName;
  final int progressPercentage;

  CouponTile({required this.companyName, required this.progressPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Icon(Icons.local_offer, color: Colors.orange),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progressPercentage / 100,
              minHeight: 20,
              backgroundColor: Theme.of(context).primaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              '${progressPercentage}%',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressIndicatorWithLabel extends StatelessWidget {
  final double progress;
  final int reviewsCount;
  final int totalReviews;

  const CircularProgressIndicatorWithLabel({
    Key? key,
    required this.progress,
    required this.reviewsCount,
    required this.totalReviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                value: progress,
                color: Colors.orange,
              ),
            ),
            Text(
              '$reviewsCount/$totalReviews',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
