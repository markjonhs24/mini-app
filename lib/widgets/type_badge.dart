import 'package:flutter/material.dart';

/// A widget that displays a badge for a Pokémon type with appropriate colors and styling.
/// The badge color is determined by the Pokémon type, and it can be displayed in a smaller size if needed.
class TypeBadge extends StatelessWidget {
  final String type;
  final bool isSmall;

  const TypeBadge({
    super.key,
    required this.type,
    this.isSmall = false,
  });

  static const Map<String, Color> typeColors = {
    'normal': Color(0xFFA8A878),
    'fire': Color(0xFFF08030),
    'water': Color(0xFF6890F0),
    'electric': Color(0xFFF8D030),
    'grass': Color(0xFF78C850),
    'ice': Color(0xFF98D8D8),
    'fighting': Color(0xFFC03028),
    'poison': Color(0xFFA040A0),
    'ground': Color(0xFFE0C068),
    'flying': Color(0xFFA890F0),
    'psychic': Color(0xFFF85888),
    'bug': Color(0xFFA8B820),
    'rock': Color(0xFFB8A038),
    'ghost': Color(0xFF705898),
    'dragon': Color(0xFF7038F8),
    'dark': Color(0xFF705848),
    'steel': Color(0xFFB8B8D0),
    'fairy': Color(0xFFEE99AC),
  };

  static Color getTypeColor(String type) {
    return typeColors[type.toLowerCase()] ?? const Color(0xFF68A090);
  }

  @override
  Widget build(BuildContext context) {
    final color = getTypeColor(type);
    final displayType = type[0].toUpperCase() + type.substring(1);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        displayType,
        style: TextStyle(
          color: Colors.white,
          fontSize: isSmall ? 10 : 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
