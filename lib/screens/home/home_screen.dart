import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/pokemon_list/pokemon_list_bloc.dart';
import '../../bloc/pokemon_list/pokemon_list_event.dart';
import '../../bloc/pokemon_list/pokemon_list_state.dart';
import '../../theme/app_colors.dart';
import '../../widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Trigger API when user navigates to home screen
    context.read<PokemonListBloc>().add(const PokemonListEvent.load());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PokemonListBloc>().add(const PokemonListEvent.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(context, state),
              ...state.when(
                initial: () => [_buildLoading()],
                loading: () => [_buildLoading()],
                loaded: (pokemon, hasMore, isLoadingMore) => [
                  _buildGrid(pokemon),
                  if (isLoadingMore) _buildLoadingMore(),
                ],
                error: (message) => [_buildError(context, message)],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, PokemonListState state) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: primaryColor,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Pokemon',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryColor,
                primaryColor.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -30,
                top: -30,
                child: Icon(
                  Icons.catching_pokemon,
                  size: 150,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context
                .read<PokemonListBloc>()
                .add(const PokemonListEvent.refresh());
          },
          icon: const Icon(
            Icons.refresh_rounded,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            context.go('/login');
          },
          icon: const Icon(
            Icons.logout_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Loading Pokémon...',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: removeColor,
            ),
            const SizedBox(height: 16),
            const Text(
              'Failed to load Pokémon',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context
                    .read<PokemonListBloc>()
                    .add(const PokemonListEvent.load());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List pokemon) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final pokemonItem = pokemon[index];
            return PokemonCard(
              pokemon: pokemonItem,
              onTap: () {
                context.push('/pokemon/${pokemonItem.id}');
              },
            );
          },
          childCount: pokemon.length,
        ),
      ),
    );
  }

  Widget _buildLoadingMore() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
