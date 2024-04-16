import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lddm01/TelaInvestimento.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Map<String, String>> despesasFixas = [];
  List<Map<String, String>> valorEntrado = [];
  List<Map<String, String>> lazer = [];
  List<Map<String, String>> outros = [];
  TextEditingController despesasFixasController = TextEditingController();
  TextEditingController valorEntradoController = TextEditingController();
  TextEditingController lazerController = TextEditingController();
  TextEditingController outrosController = TextEditingController();

  @override
  void dispose() {
    despesasFixasController.dispose();
    valorEntradoController.dispose();
    lazerController.dispose();
    outrosController.dispose();
    super.dispose();
  }

  void adicionarDespesa(String titulo, TextEditingController controller) {
    Map<String, String> novaDespesa = {
      titulo: controller.text,
    };
    setState(() {
      if (titulo == 'Despesas Fixas') {
        despesasFixas.add(novaDespesa);
      } else if (titulo == 'Valor Entrado') {
        valorEntrado.add(novaDespesa);
      } else if (titulo == 'Lazer') {
        lazer.add(novaDespesa);
      } else if (titulo == 'Outros') {
        outros.add(novaDespesa);
      }
    });
  }

  double calcularValorTotal() {
    double total = 0.0;
    despesasFixas.forEach((despesa) {
      despesa.forEach((key, value) {
        total -= double.parse(value);
      });
    });
    valorEntrado.forEach((despesa) {
      despesa.forEach((key, value) {
        total += double.parse(value);
      });
    });
    lazer.forEach((despesa) {
      despesa.forEach((key, value) {
        total += double.parse(value);
      });
    });
    outros.forEach((despesa) {
      despesa.forEach((key, value) {
        total += double.parse(value);
      });
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Container(
              color: Colors.lightGreen.withOpacity(0.3),
              padding: EdgeInsets.all(10),
              child: Text(
                'VALOR TOTAL: ${calcularValorTotal().toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Despesas Fixas',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: despesasFixasController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Despesas Fixas'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarDespesa('Despesas Fixas', despesasFixasController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Despesas Fixas', despesasFixas),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Valor Entrado',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: valorEntradoController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Valor Entrado'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarDespesa('Valor Entrado', valorEntradoController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Valor Entrado', valorEntrado),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Lazer',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: lazerController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Lazer'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarDespesa('Lazer', lazerController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Lazer', lazer),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Outros',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: outrosController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Outros'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarDespesa('Outros', outrosController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Outros', outros),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInvestimento()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 54, 244, 165).withOpacity(0.1),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
              child: Text('IR PARA INVESTIMENTOS'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(String title, List<Map<String, String>> data) {
    return DataTable(
      columnSpacing: 15,
      columns: [
        DataColumn(label: _tableHeader(title)),
      ],
      rows: data.map((despesa) {
        return DataRow(cells: [
          DataCell(_tableCell(despesa[title])),
        ]);
      }).toList(),
    );
  }

  Widget _tableHeader(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _tableCell(String? text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text(
        text ?? '',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
