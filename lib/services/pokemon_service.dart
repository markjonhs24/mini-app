import 'package:dio/dio.dart';
import '../models/pokemon.dart';

class PokemonService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  final Dio _dio;

  PokemonService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: _baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

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

  void dispose() {
    _dio.close();
  }
}

class PokemonServiceException implements Exception {
  final String message;

  PokemonServiceException(this.message);

  @override
  String toString() => message;
}
