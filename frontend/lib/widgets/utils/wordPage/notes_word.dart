import 'package:flutter/material.dart';

class DraggableExpandableNote extends StatefulWidget {
  final String text;

  const DraggableExpandableNote({super.key, required this.text});

  @override
  State<DraggableExpandableNote> createState() => _DraggableExpandableNoteState();
}

class _DraggableExpandableNoteState extends State<DraggableExpandableNote> {
  bool expanded = false;
  Offset position = const Offset(100, 100);

  void _toggleExpanded() {
    setState(() => expanded = !expanded);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
          });
        },
        onTap: _toggleExpanded,
        child: RepaintBoundary(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: expanded
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 204, 181),
              borderRadius: BorderRadius.circular(expanded ? 16 : 100),
            ),
            constraints: BoxConstraints(
              minWidth: expanded ? 120 : 36,
              maxWidth: expanded ? 200 : 36,
              minHeight: 36,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: expanded ? 1.0 : 0.0,
              child: expanded
                  ? Text(
                      widget.text,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      softWrap: true,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}