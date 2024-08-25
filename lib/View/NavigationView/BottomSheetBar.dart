import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BottomSheetBarPage extends StatefulWidget {
  final String title;

  const BottomSheetBarPage({Key? key, this.title = ''}) : super(key: key);

  @override
  BottomSheetBarPageState createState() => BottomSheetBarPageState();
}

class BottomSheetBarPageState extends State<BottomSheetBarPage> {
  bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 5;
  final _bsbController = BottomSheetBarController();

  @override
  Widget build(BuildContext context) => Scaffold(

    body: BottomSheetBar(
      backdropColor: Colors.white,
      locked: _isLocked,
      controller: _bsbController,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      borderRadiusExpanded: const BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.white,
          spreadRadius: 5.0,
         // blurRadius: 32.0,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
      expandedBuilder: (scrollController) {
        final itemList =
        List<int>.generate(_listSize, (index) => index + 1);

        // Wrapping the returned widget with [Material] for tap effects
        return Material(
          color: Colors.transparent,
          child: CustomScrollView(
            controller: scrollController,
            shrinkWrap: true,
            slivers: [
              SliverFixedExtentList(
                itemExtent: 56.0, // I'm forcing item heights
                delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                    title: Text(
                      itemList[index].toString(),
                      style: const TextStyle(fontSize: 20.0),
                    ),

                  ),
                  childCount: _listSize,
                ),
              ),
            ],
          ),
        );
      },
      collapsed: TextButton(
        onPressed: () => _bsbController.expand(),
        child: Text(
          'Click${_isLocked ? "" : " or swipe"} to expand',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('BottomSheetBar is'),
            Text(
              _isLocked ? 'Locked' : 'Unlocked',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              _isLocked
                  ? 'Bottom sheet cannot be expanded or collapsed by swiping'
                  : 'Swipe it to expand or collapse the bottom sheet',
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _toggleLock,
      tooltip: 'Toggle Lock',
      child:
      _isLocked ? const Icon(Icons.lock) : const Icon(Icons.lock_open),
    ),
  );

  @override
  void dispose() {
    _bsbController.removeListener(_onBsbChanged);
    super.dispose();
  }

  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
    super.initState();
  }



  void _onBsbChanged() {
    if (_bsbController.isCollapsed && !_isCollapsed) {
      setState(() {
        _isCollapsed = true;
        _isExpanded = false;
      });
    } else if (_bsbController.isExpanded && !_isExpanded) {
      setState(() {
        _isCollapsed = false;
        _isExpanded = true;
      });
    }
  }
  void _toggleLock() {
    setState(() {
      _isLocked = !_isLocked;
    });
  }
}

