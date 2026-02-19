import 'package:dio/dio.dart';
import '../models/pokemon.dart';

class PokemonService {
  // The base URL for the PokeAPI
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  final Dio _dio;

  // The PokemonService is responsible for fetching data from the PokeAPI.
  // It provides methods to fetch a list of Pokemon and detailed information about a specific Pokemon.
  // The service uses Dio for making HTTP requests and includes error handling to provide user-friendly messages in case of network issues or API errors.
  PokemonService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: _baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

  // Fetches a paginated list of Pokemon with basic information (name and URL)
  Future<PokemonListResponse> fetchPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );
      return PokemonListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw PokemonServiceException(_handleDioError(e));
    } catch (e) {
      throw PokemonServiceException('Unexpected error: $e');
    }
  }

  // Fetches detailed information about a specific Pokemon by its ID
  Future<Pokemon> fetchPokemon(int id) async {
    try {
      final response = await _dio.get('/pokemon/$id');
      return Pokemon.fromJson(response.data);
    } on DioException catch (e) {
      throw PokemonServiceException(_handleDioError(e));
    } catch (e) {
      throw PokemonServiceException('Unexpected error: $e');
    }
  }

  // Added method to fetch Pokemon by name for better user experience
  Future<Pokemon> fetchPokemonByName(String name) async {
    try {
      final response = await _dio.get('/pokemon/${name.toLowerCase()}');
      return Pokemon.fromJson(response.data);
    } on DioException catch (e) {
      throw PokemonServiceException(_handleDioError(e));
    } catch (e) {
      throw PokemonServiceException('Unexpected error: $e');
    }
  }

  // handling Dio exceptions and converting them to user-friendly messages
  // production apps should have robust error handling to improve user experience
  // this is a simplified example for demonstration purposes
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          return 'Pokémon not found.';
        }
        return 'Server error: $statusCode';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      default:
        return 'Network error: ${e.message}';
    }
  }

  // It's important to dispose of the Dio client when it's no longer needed to free up resources and prevent memory leaks.
  void dispose() {
    _dio.close();
  }
}

// Custom exception class for PokemonService to provide more specific error messages
class PokemonServiceException implements Exception {
  final String message;

  PokemonServiceException(this.message);

  @override
  String toString() => message;
}
