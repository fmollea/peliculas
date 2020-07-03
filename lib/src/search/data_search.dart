import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  final list = [
    'Spiderman',
    'El hoyo',
    'Superman',
    'El valhalla',
    'Troya',
    'Troyanos',
    'Capitan américa',
    'Titanes',
    'Spinners low',
    'Super hero',
    'Cap 2 t0'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final listEmpty = ['Capitan América', 'Spiderman'];
    
    final listSuggestions = (query.isEmpty) ? listEmpty
        : list.where( (p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: listSuggestions.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(listSuggestions[i]),
            leading: Icon(Icons.movie),
            onTap: () {},
          );
        });
  }

}