import 'package:flutter/material.dart';
import '../widgets/mai_drawer.dart';

class Filter_screen extends StatefulWidget {
  static const routName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;

  Filter_screen(this.saveFilters,this.currentFilters);

  @override
  _Filter_screenState createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetrian = false;

  @override
  void initState() {
     _glutenfree = widget.currentFilters['gluten'];
     _lactosefree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetrian = widget.currentFilters['vegetrian'];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetrian': _vegetrian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluteen-free'),
                value: _glutenfree,
                subtitle: Text('only include gluten-free meals'),
                onChanged: (newValue) {
                  setState(() {
                    _glutenfree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose-free'),
                value: _lactosefree,
                subtitle: Text('only include Lactose-free meals'),
                onChanged: (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: _vegan,
                subtitle: Text('only include Vegan meals'),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetrian'),
                value: _vegetrian,
                subtitle: Text('only include Vegetrian meals'),
                onChanged: (newValue) {
                  setState(() {
                    _vegetrian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
