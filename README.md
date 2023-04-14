# Getting Started

A not-so-new *Flutter* Application **arises**.
'Everything is a Widget.'

## First Considerations

I'm using as references:

- [x] Alura Classes (Flutter Course),
- [x] Flutter Apprentice by **Mike, Moore & Ngo**.
- [x] Beginning Flutter 3.0 with Dart by **Sanjib Sinha**.
- [x] The lovely Flutter Documentation by **Google Team**.

___

## What is Flutter

In the simplest terms, Flutter is a software development toolkit from Google for building cross-platform apps. Flutter apps consist of a series of packages, plugins and widgets - but that's not all. Flutter is a process, a philosophy and a community as well.

Flutter ->

- [x] is *Open-Source*.
- [x] uses *Dart* programming language, a modern C-style, UI-focused language.
- [x] has *Hot Reload*, which allows you to make updates to the code that reflect without recompiling.
- [x] has *Material Design* natively.
- [x] has *composable* widgets, giving you room for creativity.
- [x] has *Platform Integration*, making it possible to support Kotlin, Java, o-C and Swift code.

## Flutter Structure

Class defines the Type of an Object, as we learned in Dart. In the same way, in Flutter, every Widget, or Class, has its own 'Type'. The Flutter Structure starts with one Widget, after that, a branch of Widgets, and so it goes in the shape of a tree. Each Widget is a separate Class, however they are connected with each other.

## Widgets

Two types of Widgets: Visible and not Visible. As for visible, we have Text(), Button widgets, and so on, for the not so visible we have those that make up layouts, like Row, Column, Stack, etc...  
Widgets describe what their view should look like given their current configuration and state, when a widget's state changes, it rebuilds its description, and minimal changes are processed.

### Container

A Widget that surrounds the child with some padding and applies additional constraints to the padded extent. Containers with no children try to be as big as possible. In short, Containers try, in order, to size itself to the child, to honor the width, height, and constraints, to fit the parent, to be as small as possible.  
When using a Container for the whole purpose of constraining a size, use *SizedBox* instead.

### Stack

A useful class if you want to overlap several children in a simple way, for example, having some text and an image, overlaid with a gradient and a button attached to the bottom. A Stack can be used to position its children relative to the edges of its box, making it possible to to position widgets over one another.  
If you want to lay a number of children out in a particular pattern, or if you want to make a custom layout manager, you probably want to use CustomMultiChildLayout instead, because when using Stack, you can't position children relative to their size or the Stack's own size.

### Column, Row

Column display its children in a vertical array, whilst a Row in a horizontal array. To cause a child to expand to fill the available space, wrap the child in an Expanded widget. These Widgets are not meant to be scrollable, use ListView given that's your intention.
If you only have one child, then consider using Align or Center to position the child.

### ElevatedButton

A label child displayed on a Material widget whose Material.elevation increases when the button is pressed. Avoid using elevated buttons on already-elevated content such as dialogs or cards.

### Scaffold

Widget that implements the basic Material Design visual layout structure. This class provides APIs for showing drawers and bottom sheets.
The Scaffold will expand to fill the available space, that usually means it will occupy its full window or device screen. By default, the scaffold's body is resized to make room for the keyboard. To prevent the resize, set resizeToAvoidBottomInset to false.

### ListView

The most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView. When a ListView is no longer sufficient, for example because the scroll view is to have both a list and a grid, or because the list is to be combined with a SilverAppBar, etc, it is straight- forward to port code from using ListView to using CustomScrollView directly.

### Padding

A widget that insets is child by the given padding. Padding shrinks the constraints by the given number, causing the child to layout at a smaller size, then it sizes itself to its child's size, inflated by the padding, effectively creating empty space around the child.  
Yes, padding property on a Container Widget is just Padding widget implicitly. In fact, the majority of widgets in Flutter are simply combinations of other simples widgets.

### SingleChildScrollView

This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).
It is also useful if you need to shrink-wrap in both axes (the main scrolling direction as well as the cross axis), as one might see in a dialog or pop-up menu. In that case, you might pair the SingleChildScrollView with a ListBody child.
When you have a list of children and do not require cross-axis shrink-wrapping behavior, for example a scrolling list that is always the width of the screen, consider ListView, which is vastly more efficient than a SingleChildScrollView containing a ListBody or Column with many children.

### SnackBar

A lightweight message with an optional action which briefly displays at the bottom of the screen.

### FutureBuilder

Widget that builds itself based on the latest snapshot of interaction with a Future. Widget rebuilding is scheduled by the completion of the Future, using setState(). The Future must have been obtained earlier, e.g. during State.initState, State.didUpdateWidget, or  State.didChangeDependencies. It must not be created during the State.build or StatelessWidget.build method call when constructing the FutureBuilder. If the future is create as the same time as the FutureBuilder, then every time the FutureBuilder's parent is rebuilt, the asynchronous task will be restarted.

## Types of Widgets

All widgets are immutable, but some have state attached to them using their element.
There are three major types of widgets. *Stateless, Stateful* and *Inherited*.

### Build() and BuildContext

A handle to the location of a widget in the Widget Tree.
BuildContext objects are passed to WidgetBuilder functions such as StatelessWidget.build, and are available from the State.context member. Some static functions (e.g. showDialog, Theme.of, and so forth) also take build contexts so that they can act on behalf of the calling widget, or obtain data specifically for the given context.
The framework calls build() method when such widget is inserted into the tree in a given BuildContext and when the dependencies of this Widget change

### Stateless Widget

A widget that does not require mutable state. It describes part of the user interface by building a constellation of other widgets that describe the user interface more concretely, this process continues recursively until the desc of the user interface is fully concrete. You can't alter the state or properties of Stateless Widget once it's built.
Stateless Widgets are useful when the part of the user interface you are describing does not depend on anything other than the configuration info in the object itself and BuildContext in which the widget is inflated. For compositions that chan change dynamically, or that depend on some system state, consider using *StatefulWidget*.

The lifecycle of Stateless Widgets starts with a constructor, which you can pass parameters to, and a build() method, which you override.

![Flutter Apprentice, Page 147](/docs/flutter_apprentice_p147.png)

The events that trigger this kind of widget to update are:

1. The Widget is inserted into the Widget Tree for the first time.
2. The state of a dependency or Inherited Widget - ancestor nodes - changes.

### Stateful Widget

Stateful Widgets preserve state, which is useful when parts of your UI need to change dynamically. For example, one good time to use a Stateful Widget is when a user taps a *Favourite* Button to toggle a simple Boolean value on and off.

![Flutter Apprentice, Page 148](/docs/flutter_apprentice_p148.png)

Stateful Widgets store their mutable state in a separate State Class. That's why every Stateful Widget must override and implement createState().
State is information that can be read synchronously when the Widget is built and might change during the lifetime of the Widget. It's the responsibility of the Widget Implementer to ensure that the State is promptly notified when such state changes, using State.setState().

### State Object LifeCycle

Every widget's build() method takes a BuildContext as an argument. The build context tells you where you are in the Widgets Tree. You can access the *element* for any widget through the BuildContext.

![Flutter Apprentice, Page 149](/docs/flutter_apprentice_p149.png)

1. When you assign the Build Context to the Widget, an internal flag, *mounted*, is set to *true*. This lets the framework know that this widget is currently on the Widget Tree.

___

## Widget Tree, Build, and BuildContext

Every widget contains a build() method. In this method, you create a UI composition by nesting widgets within other widgets. This forms a *tree-like data structure*. Each widget can contain other widgets, commonly called *children*.
The Widget Tree provides a blueprint that describes how you want to lay out your UI. The framework moves the nodes forth and back in the tree and calls each build() method to compose your entire UI.

### The Four Parts of Framework Layer

There are three layers in Flutter's Architecture, they are:  
Framework (Dart); Engine (C/C++); Embedder (Platform-specific).

In the Framework Layout, there are four sub-layers:  
Material or Cupertino; Widgets; Rendering; Foundation.

- Material and Cupertino are UI control libraries built on top of the widget layer. They make your UI look and feel like Android and iOS apps.

- The Widgets layer is a composition abstraction of widgets. It contains all the primitive classes needed to create UI controls.

- The Rendering layer is a layout abstraction that draws and handles the widget's layout. Imagine having to recompute every widget's coordinates and frames manually.

- Foundation, also known as the dart:ui layer, contains core libraries that handle animation, painting and gestures.

### The Trees

Flutter's Framework manages three trees in parallel:

- Widget: The public API or blueprint for the framework. Dev usually just deal with composing widgets.

- Element: Manages a widget and a widget's render object. For every widget instance in the tree, there is a corresponding element.
  - ComponentElement: A type of element that's composed of other elements. This corresponds to composing widgets inside other widgets. You can think of it as a group of elements.
  - RenderObjectElement: A type of element that holds a render object. You can think of it as a single element.

- RenderObject: Responsible for drawing and laying out a specific widget instance, it also handles user interactions, like hit-testing and gestures.

___

## Navigation and Routing

Navigation, or how users switch between screens, is an important concept to master. Good navigation keeps your app organised and helps users find their way around without getting frustrated.

### Navigator 1.0

In Flutter, you use a Navigator Widget to manage your screens or pages, as though they were routes. It uses a stack to control the routes. A Stack is a data structure that manages pages. You insert the elements last in, first out (LIFO), and only the element at the top of the stack is visible to the user.

Before Flutter 1.22, you could only shift between screens by using direct commands like 'show this now' or 'remove the current screen and go back to the previous one'. Navigator 1.0 provides a simple set of APIs to navigate between screens, the most common ones are push() and pop().

The imperative API may seem natural and easy to use, but, in practice, it's hard to manage and scale. Another disadvantage of Navigator 1.0 is that it doesn't update the web URL path, which may, sometimes, cause the browser's forwards and backwards buttons not to work as expected. And finally, the Back button on Android devices might not work with Navigator 1.0 when you have nested navigators or add Flutter to your host Android app.

### Router API

Introduced in Flutter 1.22, a new declarative API that lets you control your navigation stack completely, also known as Navigator 2.0, Router API aims to feel more Flutter-like while solving the plain problems of Nav 2.0.
With Router API, you can manipulate and manage your page routes, with more power and more control; you can use imperative and declarative styles in the same app, which makes it backwards compatible; it gives you control over which navigator (in nested navigators) has the priority; you can parse routes and handle web URLs and deep linking.

![Flutter Apprentice, Page 281](/docs/flutter_apprentice_p281.png)

- *Page*: An abstract class that describes the configuration for a route.
- *Router*: Handles configuring the list of Pages the Navigator displays. Plus the Router is a listener of the state, so it receives a notification when the state changes.
- *RouterDelegate*: Defines how the router listens for changes to the app state to rebuild the navigator's configuration.
- *RouteInformationProvider*: Provides RouteInformation to the router. Route information contains the location info and state object to configure your app.
- *RouteInformationParser*: Parses route info into a user-defined data type.
- *BackButtonDispatcher*: Reports presses on the platform system's Back button to the router.
- *TransitionDelegate*: Decides how pages transition into and out of the screen.

### Navigator 1.0 vs Navigator 2.0 (Router API)

For medium to large apps, consider using a declarative API and a Router Widget when managing a lot of your navigation state.
For small apps, the imperative API is suitable to rapid prototyping and/or creating small app for demos. Sometimes push and pop are all you need.

___

## Networking, Persistence and State

Most apps interact with the network to retrieve data and then persist that data locally in some form of cache, such as a database.

There are three primary ways to save data to your device:

- Write formatted data, like JSON, to a file.
  - Simple, but requires you to handle reading and writing data in the correct format and order.
- Use a library or a plugin to write simple data to a shared location.
  - The shared_preferences plugin can be used to persist key-value data on disk.
- Use a SQLite database.
  - Exactly what you need for when you have to persist and query large amounts of data on the local device. It's got faster inserts and updates.
