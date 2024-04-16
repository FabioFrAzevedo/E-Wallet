import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaInvestimento extends StatefulWidget {
  @override
  _TelaInvestimentoState createState() => _TelaInvestimentoState();
}

class _TelaInvestimentoState extends State<TelaInvestimento> {
  List<Map<String, String>> investimentos = [];
  List<Map<String, String>> acoesCompradas = [];
  List<Map<String, String>> lucroPrejuizo = [];
  List<Map<String, String>> dividendosRecebidos = [];
  TextEditingController investimentosController = TextEditingController();
  TextEditingController acoesCompradasController = TextEditingController();
  TextEditingController lucroPrejuizoController = TextEditingController();
  TextEditingController dividendosRecebidosController = TextEditingController();

  @override
  void dispose() {
    investimentosController.dispose();
    acoesCompradasController.dispose();
    lucroPrejuizoController.dispose();
    dividendosRecebidosController.dispose();
    super.dispose();
  }

  void adicionarInvestimento(String titulo, TextEditingController controller) {
    Map<String, String> novoInvestimento = {
      titulo: controller.text,
    };
    setState(() {
      if (titulo == 'Investimentos') {
        investimentos.add(novoInvestimento);
      } else if (titulo == 'Ações Compradas') {
        acoesCompradas.add(novoInvestimento);
      } else if (titulo == 'Lucro/Prejuízo') {
        lucroPrejuizo.add(novoInvestimento);
      } else if (titulo == 'Dividendos Recebidos') {
        dividendosRecebidos.add(novoInvestimento);
      }
    });
  }

  double calcularValorTotal() {
    double total = 0.0;
    investimentos.forEach((investimento) {
      investimento.forEach((key, value) {
        total += double.parse(value);
      });
    });
    acoesCompradas.forEach((investimento) {
      investimento.forEach((key, value) {
        total += double.parse(value);
      });
    });
    lucroPrejuizo.forEach((investimento) {
      investimento.forEach((key, value) {
        total += double.parse(value);
      });
    });
    dividendosRecebidos.forEach((investimento) {
      investimento.forEach((key, value) {
        total += double.parse(value);
      });
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investimentos'),
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
                        'Investimentos',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: investimentosController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Investimentos'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarInvestimento('Investimentos', investimentosController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Investimentos', investimentos),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Ações Compradas',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: acoesCompradasController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Ações Compradas'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarInvestimento('Ações Compradas', acoesCompradasController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Ações Compradas', acoesCompradas),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Lucro/Prejuízo',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: lucroPrejuizoController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Lucro/Prejuízo'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarInvestimento('Lucro/Prejuízo', lucroPrejuizoController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Lucro/Prejuízo', lucroPrejuizo),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Dividendos Recebidos',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.purple.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: dividendosRecebidosController,
                          decoration: InputDecoration(border: InputBorder.none, hintText: 'Dividendos Recebidos'),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionarInvestimento('Dividendos Recebidos', dividendosRecebidosController);
                        },
                        child: Text('Adicionar'),
                      ),
                      SizedBox(height: 10),
                      _buildTable('Dividendos Recebidos', dividendosRecebidos),
                    ],
                  ),
                ),
              ],
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
      rows: data.map((investimento) {
        return DataRow(cells: [
          DataCell(_tableCell(investimento[title])),
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
