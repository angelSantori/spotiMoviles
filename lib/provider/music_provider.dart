import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spoti/models/models.dart';

class MusicProvider extends ChangeNotifier {
  String _baseUrl = 'https://api.spotify.com/v1';
  String _accessToken =
      'BQASLdPvj4ewEfsa1ykux087E5QEzPjFlnx1djoyFSg_1NyZ7c8b0RYtGS95XF4J_pCV3fF4nturF816pxYzD5Gc7jJt8XfyHLyrB0oozNhwAAWAAhciQxNrNJFPB9IuyXh8N2Uv6B_2czwTWI_W41MJeqWf_5jclsB_ClOQOuDrGPQSB6vo_OBsfhYi8gSXSg4vWCYbU4Z-TJXhFZ3zGwftCeQevoRu0g21Z975gQe5th0SbthannCDbiZLQ0gJ67g52PLpIgvDPw';

  List<Item> itemNewReleases = [];

  List<Item> tracks = [];

  MusicProvider() {
    getAlbums();
  }

  getAlbums() async {
    try {
      final response =
          //Duda con el https
          await http.get(Uri.parse('$_baseUrl/browse/new-releases'), headers: {
        'Authorization': 'Bearer $_accessToken',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoData = json.decode(response.body);
        final AlbumResponse albumResponse = AlbumResponse.fromJson(decoData);

        itemNewReleases = albumResponse.albums.items;

        notifyListeners();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: ${error}');
    }
  }

  getTracksAlbum() async {
    try {
      final response = await http.get(
          Uri.parse('$_baseUrl/albums/${itemNewReleases[5]}/tracks'),
          headers: {
            'Authorization': 'Bearer $_accessToken',
          });

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoData = json.decode(response.body);
        final AlbumTracksResponse albumTracks =
            AlbumTracksResponse.fromJson(decoData);

        tracks = albumTracks.items;

        notifyListeners();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: ${error}');
    }
  }
}
