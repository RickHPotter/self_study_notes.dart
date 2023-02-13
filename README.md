A not-so-new <i>Flutter</i> Application <b>arises</b>.

## First Considerations

I'm using as references:
- [x] Alura Classes (Flutter Course),
- [x] Flutter Apprentice by **Mike, Moore & Ngo**.
- [x] Beginning Flutter 3.0 with Dart by **Sanjib Sinha**.
- [x] The lovely Flutter Documentation by **Google Team**.

# Getting Started

'Everything is a Widget.'

## What is Flutter

<p>In the simplest terms, Flutter is a software development toolkit from Google for building
cross-platform apps. Flutter apps consist of a series of packages, plugins and widgets - but that's
not all. Flutter is a process, a philosophy and a community as well.</p>

Flutter ->
- [x] is *Open-Source*.
- [x] uses *Dart* programming language, a modern C-style, UI-focused language.
- [x] has *Hot Reload*, which allows you to make updates to the code that reflect without recompiling.
- [x] has *Material Design* natively.
- [x] has *composable* widgets, giving you room for creativity.
- [x] has *Platform Integration*, making it possible to support Kotlin, Java, o-C and Swift code.

# Flutter Structure

<p>Class defines the Type of an Object, as we learned in Dart.</p>
<p>In the same way, in Flutter, every Widget, or Class, has its own 'Type'. The Flutter Structure
starts with one Widget, after that, a branch of Widgets, and so it goes in the shape of a tree.
Each Widget is a separate Class, however they are connected with each other.</p>


## Widgets

<p>Two types of Widgets: Visible and not Visible. As for visible, we have Text(), Button widgets,
and so on, for the not so visible we have those that make up layouts, like Row, Column, Stack...</p>
<p>Widgets describe what their view should look like given their current configuration and state,
when a widget's state changes, it rebuilds its description, and minimal changes are processed.</p>

### Container

<p>A Widget that surrounds the child with some padding and applies additional constraints to the
padded extent. Containers with no children try to be as big as possible. In short, Containers
try, in order, to size itself to the child, to honor the width, height, and constraints, to fit
the parent, to be as small as possible.</p>
<p>When using a Container for the whole purpose of constraining a size, use *SizedBox* instead.</p>

### Stack 

<p>A useful class if you want to overlap several children in a simple way, for example, having
some text and an image, overlaid with a gradient and a button attached to the bottom.</p>
<p>A Stack can be used to position its children relative to the edges of its box, making it
possible to to position widgets over one another.</p>
<p>If you want to lay a number of children out in a particular pattern, or if you want to make a
custom layout manager, you probably want to use CustomMultiChildLayout instead, because when
using Stack, you can't position children relative to their size or the Stack's own size.</p>

### Column, Row

<p>Column display its children in a vertical array, whilst a Row in a horizontal array.</p>
<p>To cause a child to expand to fill the available space, wrap the child in an Expanded widget.</p>
<p>These Widgets are not meant to be scrollable, use ListView given that's your intention.</p>
<p>If you only have one child, then consider using Align or Center to position the child.</p>

### ElevatedButton

<p>A label child displayed on a Material widget whose Material.elevation increases when the button
is pressed.</p>
<p>Avoid using elevated buttons on already-elevated content such as dialogs or cards.</p>

### Scaffold

<p>Widget that implements the basic Material Design visual layout structure. This class provides
APIs for showing drawers and bottom sheets.</p>
<p>The Scaffold will expand to fill the available space, that usually means it will occupy its full
window or device screen. By default, the scaffold's body is resized to make room for the keyboard.
To prevent the resize, set resizeToAvoidBottomInset to false.</p>

### ListView

<p>The most commonly used scrolling widget. It displays its children one after another in the scroll
direction. In the cross axis, the children are required to fill the ListView.</p>
<p>When a ListView is no longer sufficient, for example because the scroll view is to have both a
list and a grid, or because the list is to be combined with a SilverAppBar, etc, it is straight-
forward to port code from using ListView to using CustomScrollView directly.</p>

### Padding

<p>A widget that insets is child by the given padding. Padding shrinks the constraints by the given
number, causing the child to layout at a smaller size, then it sizes itself to its child's size,
inflated by the padding, effectively creating empty space around the child.</p>
<p>Yes, padding property on a Container Widget is just Padding widget implicitly. In fact, the
majority of widgets in Flutter are simply combinations of other simples widgets.</p>

### SingleChildScrollView

<p></p>

### SnackBar

<p></p>

###


## Types of Widgets

<p>All widgets are immutable, but some have state attached to them using their element.</p>
<h3>There are three major types of widgets. *Stateless, Statefull* and *Inherited*.</h3>

### Build() and BuildContext

<p>A handle to the location of a widget in the Widget Tree.</p>
<p>BuildContext objects are passed to WidgetBuilder functions such as StatelessWidget.build,
and are available from the State.context member. Some static functions (e.g. showDialog,
Theme.of, and so forth) also take build contexts so that they can act on behalf of the
calling widget, or obtain data specifically for the given context.</p>
<p>The framework calls build() method when such widget is inserted into the tree in a given
BuildContext and when the dependecies of this Widget change</p>

### Stateless Widget

<p>A widget that does not require mutable state. It describes part of the user
interface by building a constellation of other widgets that describe the user
interface more concretely, this process continues recursively until the desc
of the user interface is fully concrete.</p>
<p>You can't alter the state or properties of Stateless Widget once it's built.</p>
<p>Stateless Widgets are useful when the part of the user interface you are
describing does not depend on anything other than the configuration info
in the object itself and BuildContext in which the widget is inflated.</p>
<p>For compositions that chan change dynamically, or that depend on some
system state, consider using *StatefulWdiget*.</p>

<p>The lifecycle of Stateless Widgets starts with a constructor, which you
can pass parameters to, and a build() method, which you override.</p>

![Flutter Apprentice, Page 147](/docs/flutter_apprentice_p147.png)

<p>The events that trigger this kind of widget to update are:</p>
1. The Widget is inserted into the Widget Tree for the first time.
2. The state of a dependency or Inherited Widget - ancestor nodes - changes.

### Stateful Widget

<p>Stateful Widgets preserve state, which is useful when parts of your UI need
to change dynamically. For example, one good time to use a Stateful Widget is
when a user taps a *Favourite* Button to toggle a simple Boolean value on and off.</p>

![Flutter Apprentice, Page 148](/docs/flutter_apprentice_p148.png)

<p>Stateful Widgets store their mutable state in a separate State Class. That's
why every Stateful Widget must override and implement createState().</p>
<p>State is information that can be read synchrounously when the Widget is built
and might change during the lifetime of the Widget.</p>
<p>It's the responsibility of the Widget Implementer to ensure that the State
is promptly notified when such state changes, using State.setState().</p>

### State Object LifeCycle

<p>Every widget's build() method takes a BuildContext as an argument. The build
context tells you where you are in the Widgets Tree. You can access the *element*
for any widget through the BuildContext.</p>

![Flutter Apprentice, Page 149](/docs/flutter_apprentice_p149.png)

1. When you assign the Build Context to the Widget, an internal flag, _mounted_,
is set to _true_. This lets the framework know that this widget is currently on
the Widget Tree.

# Widget Tree, Build, and BuildContext

<p>Every widget contains a build() method. In this method, you create a UI
composition by nesting widgets within other widgets. This forms a *tree-like
data structure*. Eeach widget can contain other widgets, commonly called
*children*.</p>
<p>The Widget Tree provides a blueprint that describes how you want to lay
out your UI. The framework moves the nodes forth and back in the tree and
calls each build() method to compose your entire UI.</p>

## The Four Parts of Framework Layer
<p>There are three layers in Flutter's Achitecture, they are:
Framework (Dart); Engine (C/C++); Embedder (Platform-specific).
In the Framework Layout, there are four sublayers:
Material or Cupertino; Widgets; Rendering; Foundation.</p>

- Material and CUpertino are UI control libraries built on top of the
widget layer. They make your UI look and feel like Android and iOS apps.

- The Widgets layer is a composition abstraction of widgets. It contains
all the primitive classes needed to create UI controls.

- The Rendenring layer is a layout abstraction that draws and handles the
widget's layout. Imagine having to recompute every widget's coordinates and
frames manually.

- Foundation, also known as the dart:ui layer, contains core libraries that
handle animation, painting and gestures.

## The Trees
<p>Flutter's Framework manages three trees in parallel:</p>

- Widget: The public API or blueprint for the framework. Dev usually just deal
with composing widgets.

- Element: Manages a widget and a widget's render object. For every widget
instance in the tree, there is a corresponding element.
	1. ComponentElemtn: A type of element that's composed of other elements.
	This corresponds to composing widgets inside other widgets. You can think
	of it as a group of elements.
	2. RenderObjectElement: A type of element that holds a render object. You
	can think of it as a single element.

- RenderObject: Responsible for drawing and laying out a specific widget
instance, it also handles user interactions, like hit-testing and gestures.

# Navigation and Routing

# State Management