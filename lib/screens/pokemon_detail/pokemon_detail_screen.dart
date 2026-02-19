import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/pokemon_detail/pokemon_detail_bloc.dart';
import '../../bloc/pokemon_detail/pokemon_detail_event.dart';
import '../../bloc/pokemon_detail/pokemon_detail_state.dart';
import '../../theme/app_colors.dart';
import '../../models/pokemon.dart';
import '../../widgets/type_badge.dart';
import '../../widgets/stat_bar.dart';

// This screen displays detailed information about a specific Pokemon, including its stats, abilities, and sprites. It uses a SliverAppBar for a dynamic header and handles loading/error states gracefully.

class PokemonDetailScreen extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger API when navigating to detail screen
    context
        .read<PokemonDetailBloc>()
        .add(PokemonDetailEvent.load(widget.pokemonId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildScaffold(primaryColor, _buildLoading()),
          loading: () => _buildScaffold(primaryColor, _buildLoading()),
          loaded: (pokemon) => _buildContent(pokemon),
          error: (message) =>
              _buildScaffold(primaryColor, _buildError(message)),
        );
      },
    );
  }

  Widget _buildScaffold(Color backgroundColor, Widget body) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: body,
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 16),
          Text(
            'Loading Pokémon...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          const Text(
            'Failed to load Pokémon',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<PokemonDetailBloc>().add(
                    PokemonDetailEvent.load(widget.pokemonId),
                  );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Pokemon pokemon) {
    final primaryTypeColor = pokemon.types.isNotEmpty
        ? TypeBadge.getTypeColor(pokemon.types[0].type.name)
        : primaryColor;

    return Scaffold(
      backgroundColor: primaryTypeColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: primaryTypeColor,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(pokemon, primaryTypeColor),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('About'),
                    const SizedBox(height: 16),
                    _buildAboutSection(pokemon),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Base Stats'),
                    const SizedBox(height: 16),
                    _buildStatsSection(pokemon, primaryTypeColor),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Abilities'),
                    const SizedBox(height: 16),
                    _buildAbilitiesSection(pokemon, primaryTypeColor),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Sprites'),
                    const SizedBox(height: 16),
                    _buildSpritesSection(pokemon),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Pokemon pokemon, Color primaryTypeColor) {
    return Stack(
      children: [
        Positioned(
          right: -50,
          top: 50,
          child: Icon(
            Icons.catching_pokemon,
            size: 220,
            color: Colors.white.withValues(alpha: 0.15),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        pokemon.displayName,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        pokemon.formattedId,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: pokemon.types
                      .map((type) => TypeBadge(type: type.type.name))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Hero(
              tag: 'pokemon-${pokemon.id}',
              child: CachedNetworkImage(
                imageUrl: pokemon.sprites.officialArtwork ??
                    pokemon.sprites.frontDefault ??
                    '',
                height: 180,
                placeholder: (context, url) => const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.catching_pokemon,
                  size: 120,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkColor,
      ),
    );
  }

  Widget _buildAboutSection(Pokemon pokemon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scaffoldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAboutItem(
            icon: Icons.straighten,
            label: 'Height',
            value: '${pokemon.heightInMeters} m',
            color: pokemon.types.isNotEmpty
                ? TypeBadge.getTypeColor(pokemon.types[0].type.name)
                : primaryColor,
          ),
          Container(
            height: 50,
            width: 1,
            color: dividerColor,
          ),
          _buildAboutItem(
            icon: Icons.fitness_center,
            label: 'Weight',
            value: '${pokemon.weightInKg} kg',
            color: pokemon.types.isNotEmpty
                ? TypeBadge.getTypeColor(pokemon.types[0].type.name)
                : primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(Pokemon pokemon, Color primaryTypeColor) {
    final totalStats = pokemon.stats.fold<int>(
      0,
      (sum, stat) => sum + stat.baseStat,
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scaffoldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ...pokemon.stats.map((stat) => StatBar(
                label: stat.displayName,
                value: stat.baseStat,
                color: primaryTypeColor,
              )),
          const Divider(height: 24),
          Row(
            children: [
              const SizedBox(
                width: 60,
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: darkColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 36,
                child: Text(
                  totalStats.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: primaryTypeColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAbilitiesSection(Pokemon pokemon, Color primaryTypeColor) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: pokemon.abilities.map((ability) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: ability.isHidden
                ? primaryTypeColor.withValues(alpha: 0.15)
                : scaffoldColor,
            borderRadius: BorderRadius.circular(20),
            border: ability.isHidden
                ? Border.all(color: primaryTypeColor, width: 1.5)
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ability.displayName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ability.isHidden ? primaryTypeColor : darkColor,
                ),
              ),
              if (ability.isHidden) ...[
                const SizedBox(width: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: primaryTypeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Hidden',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSpritesSection(Pokemon pokemon) {
    final sprites = [
      if (pokemon.sprites.frontDefault != null)
        {'url': pokemon.sprites.frontDefault!, 'label': 'Front'},
      if (pokemon.sprites.backDefault != null)
        {'url': pokemon.sprites.backDefault!, 'label': 'Back'},
      if (pokemon.sprites.frontShiny != null)
        {'url': pokemon.sprites.frontShiny!, 'label': 'Shiny'},
      if (pokemon.sprites.backShiny != null)
        {'url': pokemon.sprites.backShiny!, 'label': 'Shiny Back'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scaffoldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: sprites.map((sprite) {
          return Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: sprite['url']!,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.catching_pokemon,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sprite['label']!,
                style: const TextStyle(
                  fontSize: 11,
                  color: secondaryColor,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
