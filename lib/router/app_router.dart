import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/pokemon_list/pokemon_list_bloc.dart';
import '../bloc/pokemon_detail/pokemon_detail_bloc.dart';
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/pokemon_detail/pokemon_detail_screen.dart';
import '../services/pokemon_service.dart';

// This file defines the app's routing using GoRouter. It sets up the routes for the login screen, home screen, and pokemon detail screen, and also provides the necessary BlocProviders for state management on each screen.

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => BlocProvider(
        create: (context) => PokemonListBloc(
          pokemonService: PokemonService(),
        ),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/pokemon/:id',
      name: 'pokemon-detail',
      builder: (context, state) {
        final pokemonId = int.tryParse(state.pathParameters['id'] ?? '') ?? 1;
        return BlocProvider(
          create: (context) => PokemonDetailBloc(
            pokemonService: PokemonService(),
          ),
          child: PokemonDetailScreen(pokemonId: pokemonId),
        );
      },
    ),
  ],
);
