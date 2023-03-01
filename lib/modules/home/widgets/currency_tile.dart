import 'package:flutter/material.dart';

import '../../../models/currency_model.dart';

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.currency,
  });

  final CurrencyModel currency;

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
            child: Text(
              currency.key,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            currency.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: currency.sell == 0.0
              ? null
              : Text(
                  'Sell: R\$ ${currency.sell.toStringAsFixed(2).replaceAll('.', ',')}',
                ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${currency.buy.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.graphic_eq_outlined,
                    color: currency.variation < 0
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
                    ' ${(currency.variation).toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: currency.variation < 0
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
