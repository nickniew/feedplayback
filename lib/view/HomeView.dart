import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Lógica para abrir o campo de pesquisa
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Seu Nome'),
              accountEmail: Text('seuemail@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('caminho/para/sua/imagem.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                // Lógica para sair do aplicativo
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enableInfiniteScroll: false,
            ),
            items: [
              Container(
                color: Colors.red,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    // Seus itens do primeiro grid
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: const [
                    // Seus itens do segundo grid
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: const [
                    // Seus itens do terceiro grid
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Container(
          height: 72.0, // Altura da barra inferior
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ... outros widgets da barra inferior
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 110.0, // Largura do botão circular
        height: 110.0, // Altura do botão circular
        child: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IconTheme(
                  data: IconThemeData(size: 36.0, color: Colors.black),
                  child: Icon(Icons.qr_code),
                ),
                Text(
                  'AVALIAR',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ],
            ),
            onPressed: () {
        // Lógica para lidar com o botão QRcode
      },
      ),
    ),floatingActionButtonLocation
    :
    FloatingActionButtonLocation
    .
    centerDocked
    ,
    );
  }
}