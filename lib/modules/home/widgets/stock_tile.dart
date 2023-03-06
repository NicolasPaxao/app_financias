import 'package:cotacao_moedas_app/models/stock_model.dart';
import 'package:flutter/material.dart';

class StockTile extends StatelessWidget {
  const StockTile({
    super.key,
    required this.stock,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 73, 73, 73),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          textColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: FittedBox(
              child: Text(
                stock.key,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            stock.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: Text(
            stock.location,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${stock.points.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.graphic_eq_outlined,
                    color: stock.variation < 0
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    shadows: const [
                      Shadow(
                        color: Colors.white12,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  Text(
                    ' ${(stock.variation).toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: stock.variation < 0
                            ? Colors.redAccent
                            : Colors.greenAccent),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
