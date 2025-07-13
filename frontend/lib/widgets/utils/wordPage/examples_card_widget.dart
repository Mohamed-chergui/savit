import 'package:flutter/material.dart';

class ExpandableAnimatedCard extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration duration;
  final Color iconColor;

  const ExpandableAnimatedCard({
    super.key,
    required this.text,
    this.textStyle,
    this.duration = const Duration(milliseconds: 300),
    this.iconColor = Colors.black,
  });

  @override
  State<ExpandableAnimatedCard> createState() => _ExpandableAnimatedCardState();
}

class _ExpandableAnimatedCardState extends State<ExpandableAnimatedCard>
    with SingleTickerProviderStateMixin {
  bool expanded = true ;
  late final AnimationController _controller;
  late final Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _iconTurns = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  void _toggleExpanded() {
    setState(() => expanded = !expanded);
    expanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedSize(
        duration: widget.duration,
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: Container(
      
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.expand_more,
                      color: widget.iconColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.text,
                          maxLines: expanded ? null : 1,
                          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                          style: widget.textStyle,
                        ),
              
                        Padding(
                          padding: const EdgeInsets.only(top : 8.0),
                          child:  expanded ? Text(
                            "الحياة مليئة بالتحديات والفرص. من المهم أن نواجه الصعوبات بعزيمة وإصرار، وأن نستفيد من كل تجربة نمر بها. النجاح لا يأتي بسهولة، لكنه نتيجة للعمل ",
                            style: widget.textStyle,
                          ) : const SizedBox.shrink(),
                        ), 
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}