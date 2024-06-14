import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RollingAnimationContainer extends AnimatedWidget {
  const RollingAnimationContainer({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_progress.value * 240, 0),
      child: Image.asset('assets/220_strawberry.png'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: OverflowBox(
          maxWidth: double.infinity,
          child: Column(children: [
            const SizedBox(height: 20),
            Row(
              children: [
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
                const SizedBox(width: 20),
                RollingAnimationContainer(controller: _controller),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat();
                }
              },
              child: Text(_controller.isAnimating ? 'Stop' : 'Play'),
            ),
          ]),
        ),
      ),
    );
  }
}
