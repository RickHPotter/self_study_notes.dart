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
- [x] has *Platform Integration*, making it possible to to support Kotlin, Java, o-C and Swift code.

# Flutter Structure

<p>Class defines the Type of an Object, as we learned in Dart.</p>
<p>In the same way, in Flutter, every Widget, or Class, has its own 'Type'. The Flutter Structure
starts with one Widget, after that, a branch of Widgets, and so it goes in the shape of a tree.
Each Widget is a separate Class, however they are connected with each other.</p>

## Structure

### Stateless Widget

### Stateful Widget

## Widgets

<p>Two types of Widgets: Visible and not Visible. As for visible, we have Text(), Button widgets
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

# Navigation and Routing

# State Management