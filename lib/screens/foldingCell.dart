import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class FoldingCell extends StatelessWidget {
  FoldingCell({super.key});
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Folding Cell"),
      ),
      body: Container(
        color: Color.fromARGB(255, 235, 225, 228),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell.create(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerWidget: _buildInnerWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 140),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print("Cell opened"),
          onClose: () => print("Cell closed"),
        ),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "ថាវរិទ្ធ",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: TextButton(
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              child: Text("Open"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40)
              ),
            ),
          )
        ],
      ),
    );
  }

  // when toggle close
  Widget _buildInnerWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "មនុស្សស្មោះ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "ខ្ញុំ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              child: Text("Close"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40)
              ),
            ),
          )
        ],
      ),
    );
  }
}
