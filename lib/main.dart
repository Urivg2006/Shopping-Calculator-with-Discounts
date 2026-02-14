import 'package:flutter/material.dart';
import 'still.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PreuCompra(),
      theme: appTheme, 
    );
  }
}

class PreuCompra extends StatefulWidget {
  const PreuCompra({super.key});

  @override
  State<PreuCompra> createState() => _PreuCompraState();
}

class _PreuCompraState extends State<PreuCompra> {
  // nous controllers i estat
  final TextEditingController unitatsControlador = TextEditingController();
  final TextEditingController preuControlador = TextEditingController();
  double totalPreu = 0.0;
  double descompteAplicat = 0.0;  // Nova variable per al descompte

  @override
  void dispose() {
    unitatsControlador.dispose();
    preuControlador.dispose();
    super.dispose();
  }
  double preUnitat = 0.0;

  // Funció per calcular el descompte
  double _calcularDescompte(double total) {
    if (total >= 200) {
      return total * 0.15;
    } else if (total >= 100) {
      return total * 0.10;
    } else if (total >= 50) {
      return total * 0.05;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preu Compra'),
        //title: const Text('Purchase Price'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Calculadora de preus',
                //'Price Calculator',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: unitatsControlador,
                decoration: const InputDecoration(
                  labelText: 'Nombre d\'unitats',
                  //labelText: 'Number of units',
                  hintText: 'Introdueix el nombre d\'unitats',
                  //hintText: 'Enter the number of units',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: preuControlador,
                decoration: const InputDecoration(
                  labelText: 'Preu d\'una unitat',
                  //labelText: 'Unit price',
                  hintText: 'Introdueix el preu d\'una unitat',
                  //hintText: 'Enter the unit price',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final double numeroUnitats = double.tryParse(unitatsControlador.text.replaceAll(',', '.')) ?? 0.0;
                  final double preUnitat = double.tryParse(preuControlador.text.replaceAll(',', '.')) ?? 0.0;
                  setState(() {
                    totalPreu += numeroUnitats * preUnitat;
                    descompteAplicat = _calcularDescompte(totalPreu);
                    unitatsControlador.clear();
                    preuControlador.clear();
                  });

                  // Mostrar SnackBar con el total parcial
                  // Show SnackBar with subtotal
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Producte afegit. Total parcial: €${totalPreu.toStringAsFixed(2)}'),
                      // content: Text('Product added. Subtotal: €${totalPreu.toStringAsFixed(2)}'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Text('Acumular'),
                //child: const Text('Accumulate'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Calcular descuento final
                  // Calculate final discount
                  final descompte = _calcularDescompte(totalPreu);
                  final importNet = totalPreu - descompte;
                  
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Total Final'),
                      //title: const Text('Final Total'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Import brut: €${totalPreu.toStringAsFixed(2)}'),
                          // Text('Import brut: €${totalPreu.toStringAsFixed(2)}'),
                          if (descompte > 0) ...[
                            Text('Descompte (${(descompte/totalPreu*100).toStringAsFixed(0)}%): €${descompte.toStringAsFixed(2)}'),
                            // Text('Discount (${(descompte/totalPreu*100).toStringAsFixed(0)}%): €${descompte.toStringAsFixed(2)}'),
                            Text('Import net: €${importNet.toStringAsFixed(2)}'),
                            // Text('Net import: €${importNet.toStringAsFixed(2)}'),
                          ] else
                            const Text('No s\'aplica descompte'),
                            // const Text('No discount applied'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Reiniciar para nueva compra
                            // Reset for new purchase
                            setState(() {
                              totalPreu = 0.0;
                              descompteAplicat = 0.0;
                            });
                          },
                          child: const Text('Nova compra'),
                          //child: const Text('New purchase'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Total'),
                //child: const Text('Total'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    totalPreu = 0.0;
                    descompteAplicat = 0.0;
                    unitatsControlador.clear();
                    preuControlador.clear();
                  });
                },
                child: const Text('Reset'),
                //child: const Text('Reset'),
              ),
              const SizedBox(height: 20),
              // Mostra el total a la UI
              // Show total in UI
              Text(
                'Import brut: € ${totalPreu.toStringAsFixed(2)}',
                //Gross amount: € ${totalPreu.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Descompte aplicat: € ${descompteAplicat.toStringAsFixed(2)}',
                //Discount applied: € ${descompteAplicat.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Import net: € ${(totalPreu - descompteAplicat).toStringAsFixed(2)}',
                //Net amount: € ${(totalPreu - descompteAplicat).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              // Información de descuentos
              // Discount information
              const SizedBox(height: 20),
              const Divider(height: 32),
              const Text(
                'Descomptes aplicables:',
                // 'Applicable discounts:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text('Fins a 50€ → 0%'),
              // const Text('Up to 50€ → 0%'),
              const Text('De 50€ a 99,99€ → 5%'),
              // const Text('From 50€ to 99.99€ → 5%'),
              const Text('De 100€ a 199,99€ → 10%'),
              // const Text('From 100€ to 199.99€ → 10%'),
              const Text('200€ o més → 15%'),
              // const Text('More than 200€ → 15%'),
            ],
          ),
        ),
      ),
    );
  }
}
