import 'package:flutter/material.dart';

class RoundsListSection extends StatelessWidget {
  final List<String> rounds;
  final int selectedIndex;
  final Function(int) onRoundSelected;

  const RoundsListSection({
    super.key,
    required this.rounds,
    required this.selectedIndex,
    required this.onRoundSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // height of the round pills
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onRoundSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : const Color(0xFF1F2328),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.greenAccent : Colors.grey.shade700,
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  rounds[index],
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: rounds.length,
      ),
    );
  }
}
