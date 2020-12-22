import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

// import 'package:dataflex_erp/src/widgets/custom_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      drawer: Drawer(
        child: Center(
          child: Text('Hola')

        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 56.0),
            child: GridView.count(
              mainAxisSpacing: 32,
              crossAxisSpacing: 40,
              primary: false,
              crossAxisCount: 2,
              children: [
                _customCard('Pedidos', 'assets/icons/notas1.1.svg' , context),
                _customCard('Clientes', 'assets/icons/clientela.svg', context),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _customCard(String textModulo, String iconModulo, BuildContext context) {
    final cardTextStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
    return Card(
      color: Color(0xffF2F2F2),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: InkWell(
        onTap: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OnvoiceListPage()));
        },
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconModulo, height: 80, ),
            SizedBox(height: 8.0,),
            Text(textModulo, style: cardTextStyle,),
          ],
        ),
      ),
    );
  }

}