import 'package:flutter/material.dart';

import '../../../models/bitcoin_model.dart';

class BitcoinTile extends StatelessWidget {
  const BitcoinTile({
    super.key,
    required this.bitcoin,
  });

  final BrokerageModel bitcoin;

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
                bitcoin.key,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            bitcoin.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: Text(
            'Último valor: R\$ ${bitcoin.last.toStringAsFixed(2).replaceAll('.', ',')}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              bitcoin.buy == 0.0
                  ? const SizedBox()
                  : Text(
                      'R\$ ${bitcoin.buy.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.graphic_eq_outlined,
                    color: bitcoin.variation < 0
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
                    ' ${(bitcoin.variation).toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: bitcoin.variation < 0
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
