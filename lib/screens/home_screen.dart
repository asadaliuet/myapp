import 'package:flutter/material.dart';
import 'material_tab.dart';
import 'positioning_tab.dart';
import 'team_screen.dart'; // Import the new Team Screen

class PCMSelectionHome extends StatefulWidget {
  const PCMSelectionHome({super.key});

  @override
  State<PCMSelectionHome> createState() => _PCMSelectionHomeState();
}

class _PCMSelectionHomeState extends State<PCMSelectionHome>
    with SingleTickerProviderStateMixin {
  // 1. Nullable AnimationController to prevent "Lookup failed" crashes
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  Animation<double>? _scaleAnimation;

  // GlobalKeys to access child states for the Reset function
  final GlobalKey<State<MaterialSelectionTab>> _materialTabKey = GlobalKey();
  final GlobalKey<State<PositioningTab>> _positioningTabKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    
    // 2. Initialize AnimationController safely
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.elasticOut),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    // 3. Safe dispose using the null-aware operator (?)
    _animationController?.dispose();
    super.dispose();
  }

  void _handleReset() {
    // Reset both tabs using the Global Keys
    // We cast to dynamic to call the specific 'reset' method defined in the child widgets
    (_materialTabKey.currentState as dynamic)?.reset();
    (_positioningTabKey.currentState as dynamic)?.reset();
    
    // Re-trigger animation on reset for a nice effect
    _animationController?.reset();
    _animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 4. Fallback animations if controller isn't ready (defensive coding)
    final fade = _fadeAnimation ?? const AlwaysStoppedAnimation(1.0);
    final scale = _scaleAnimation ?? const AlwaysStoppedAnimation(1.0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: FadeTransition(
            opacity: fade,
            child: ScaleTransition(
              scale: scale,
              child: const Text('PCM Selection Advisor'),
            ),
          ),
          backgroundColor: Colors.green[700],
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.architecture), text: 'Material Selection'),
              Tab(icon: Icon(Icons.place), text: 'Positioning'),
            ],
          ),
          actions: [
            // NEW BUTTON: Meet the Experts
            IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: 'Meet the Experts',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamScreen()),
                );
              },
            ),
            // Existing Reset Button
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _handleReset,
              tooltip: 'Reset Form',
            ),
          ],
        ),
        body: FadeTransition(
          opacity: fade,
          child: ScaleTransition(
            scale: scale,
            child: TabBarView(
              children: [
                MaterialSelectionTab(
                  key: _materialTabKey, 
                  scaleAnimation: scale
                ),
                PositioningTab(
                  key: _positioningTabKey, 
                  scaleAnimation: scale
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}