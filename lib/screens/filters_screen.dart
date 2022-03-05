import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters_screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegeterian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluton'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegeterian = widget.currentFilters['vegeterian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final filters = {
                'gluton': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(filters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten free meal.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose free meal.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Is Vegan',
                  'Only include vegan meal.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Is Vegeterian',
                  'Only include vegeterian meal.',
                  _vegeterian,
                  (newValue) {
                    setState(
                      () {
                        _vegeterian = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
